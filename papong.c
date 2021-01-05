#include "LIB/neslib.h"
#include "LIB/nesdoug.h"
#include "papong.h" // holds our metasprite data

#pragma bss-name(push, "ZEROPAGE")

// Some structs

struct Ball {
	unsigned char x;
	unsigned char y;
	unsigned char width;
	unsigned char height;
	unsigned char x_direction;
	unsigned char y_direction;
};

struct Player {
	unsigned char x;
	unsigned char y;
	unsigned char width;
	unsigned char height;
	unsigned char y_direction;
};

// Global Variables

unsigned char pad1;
unsigned char pad2;

const unsigned char BLACK=0x00;
const unsigned char LEFT_LIMIT=16;
const unsigned char RIGHT_LIMIT=241;
const unsigned char TOP_LIMIT = 23;
const unsigned char BOTTOM_LIMIT=223;
const unsigned char MOVEMENT_NONE = 0;
const unsigned char MOVEMENT_UP = 1;
const unsigned char MOVEMENT_DOWN = 2;
const unsigned char MOVEMENT_LEFT = 3;
const unsigned char MOVEMENT_RIGHT = 4;

struct Ball ball = {120, 120, 8, 8, 4, 2};
struct Player player1 = {30, 80, 8, 32, 0};
struct Player player2 = {218, 80, 8, 32, 0};

const unsigned char palette_bg[]={
	0x0f, 0x00, 0x10, 0x30, // black, gray, lt gray, white
	0,0,0,0,
	0,0,0,0,
	0,0,0,0
};

const unsigned char palette_spr[]={
	0x0f,0x00,0x10,0x30,
	0x0f,0x11,0x21,0x31,
	0x0f,0x06,0x16,0x26,
	0x0f,0x09,0x19,0x29
};

// Functions

void fill_background(const unsigned char color) {
	ppu_off();

	vram_fill(color, NTADR_A(0, 0));

	ppu_on_all();
}

void clear_background(void) {
	fill_background(BLACK);
}

void show_text(const unsigned char * text, int x, int y) {
	static unsigned char i = 0;

	ppu_off(); // screen off

	pal_bg(palette_bg); //	load the BG palette

	// set a starting point on the screen
	// vram_adr(NTADR_A(x,y));
	vram_adr(NTADR_A(x, y)); // screen is 32 x 30 tiles

	i = 0;
	while(text[i]){
		vram_put(text[i]); // this pushes 1 char to the screen
		++i;
	}

	// vram_adr and vram_put only work with screen off
	// NOTE, you could replace everything between i = 0; and here with...
	// vram_write(text,sizeof(text));
	// does the same thing

	ppu_on_all(); //	turn on screen
}

void show_introduction(void) {
	static const char first_text[] = "Molleja Soft presents...";
	static const char second_text[] = "PAPONG";

	show_text(first_text, 5, 12);

	delay(100);

	clear_background();

	show_text(second_text, 12, 12);

	delay(100);

	clear_background();
}

void initialize_system(void) {
	// Screen off

	ppu_off();

	// Load the BG palette

	pal_bg(palette_bg);

	// Load the Sprites palette

	pal_spr(palette_spr);

	// Use the second set of tiles for the sprites

	bank_spr(1);

    // Create buffer and clear it

    set_vram_buffer();
    clear_vram_buffer();

    // Draw background

    vram_adr(NAMETABLE_A);
    vram_unrle(Background);

	// Turn on screen

	ppu_on_all();
}

void ball_movement(void){
	long collisionPlayer1 = check_collision(&ball, &player1);
	long collisionPlayer2 = 0;

	if (!collisionPlayer1) {
		collisionPlayer2 = check_collision(&ball, &player2);
	}

	if (ball.x + ball.width >= RIGHT_LIMIT || collisionPlayer2) {
		ball.x_direction = MOVEMENT_LEFT;
	} else if (ball.x <= LEFT_LIMIT || collisionPlayer1) {
		ball.x_direction = MOVEMENT_RIGHT;
	}

	if (ball.y + ball.height >= BOTTOM_LIMIT) {
		ball.y_direction = MOVEMENT_UP;
	} else if (ball.y <= TOP_LIMIT) {
		ball.y_direction = MOVEMENT_DOWN;
	}

	if (ball.x_direction == MOVEMENT_LEFT) {
		ball.x -= 1;
	} else {
		ball.x += 1;
	}

	if (ball.y_direction == MOVEMENT_UP) {
		ball.y -= 1;
	} else {
		ball.y += 1;
	}
}

void player_one_movement(void) {
	// Determine Player 1 movement

	if (pad1 & PAD_UP){
		player1.y_direction = MOVEMENT_UP;
	} else if (pad1 & PAD_DOWN){
		player1.y_direction = MOVEMENT_DOWN;
	} else {
		return;
	}

	// Check screen limits

	if (player1.y_direction == MOVEMENT_UP && player1.y <= TOP_LIMIT) {
		return;
	}

	if (player1.y_direction == MOVEMENT_DOWN && player1.y + player1.height >= BOTTOM_LIMIT) {
		return;
	}

	if (player1.y_direction == MOVEMENT_UP) {
		player1.y -= 1;
	} else {
		player1.y += 1;
	}
}

void draw(void){
    // Clear vram buffer

    clear_vram_buffer();

	// Clear all sprites from sprite buffer

	oam_clear();

	// Draw our ball

	oam_meta_spr(ball.x, ball.y, BallSprite);

	// Draw our first player

	oam_meta_spr(player1.x, player1.y, PlayerSprite);

	// Draw our second player

	oam_meta_spr(player2.x, player2.y, PlayerSprite);
}

void main(void) {
	initialize_system();

	// show_introduction();

	while (1){
		// :: Game Loop

		// Wait till beginning of the frame

		ppu_wait_nmi();

		// Read the first controller

		pad1 = pad_poll(0);

		// Read the second controller

		pad2 = pad_poll(1);

		player_one_movement();
		ball_movement();
        draw();
	}
}