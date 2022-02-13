#include "lib/neslib.h"
#include "lib/nesdoug.h"
#include "papong.h"

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
	unsigned char pad;
	unsigned char pad_number;
	unsigned char points;
	const unsigned char player_win_text[15];
};

struct Ball ball = {120, 120, 8, 8, 4, 2};
struct Player player1 = {30, 80, 8, 32, 0, 0, 0, 0, "Player 1 WINS!"};
struct Player player2 = {218, 80, 8, 32, 0, 0, 1, 0, "Player 2 WINS!"};

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

	ppu_off();

	pal_bg(palette_bg);

	vram_adr(NTADR_A(x, y));

	i = 0;

	while(text[i]) {
		vram_put(text[i]);

		++i;
	}

	ppu_on_all();
}

void show_introduction(void) {
	static const char first_text[] = "Molleja Soft presents...";
	static const char second_text[] = "PAPONG";
    static const char clear_text[] = "                        ";
	static const char version_text[] = "0.1.0";

    show_text(version_text, 25, 28);

	show_text(first_text, 4, 12);

	delay(100);

    show_text(clear_text, 4, 12);

	show_text(second_text, 13, 12);

	delay(100);

    show_text(clear_text, 4, 12);
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

void restart_round() {
	player1.y = PLAYER_INITIAL_Y;
	player2.y = PLAYER_INITIAL_Y;
	ball.x = BALL_INITIAL_X;
	ball.y = BALL_INITIAL_Y;
}

void add_point_to_player(struct Player * player) {
	++(player->points);

	if (player->points >= MAX_POINTS) {
		show_text(player->player_win_text, 9, 12);

		delay(100);

		show_text("              ", 9, 12);

		player1.points = 0;
		player2.points = 0;
	}

	delay(100);

	restart_round();
}

void ball_movement(void){
	long collisionPlayer1 = 0;
	long collisionPlayer2 = 0;

	if (ball.x + ball.width >= RIGHT_LIMIT) {
		add_point_to_player(&player1);

		return;
	}

	if (ball.x <= LEFT_LIMIT) {
		add_point_to_player(&player2);

		return;
	}

	collisionPlayer1 = check_collision(&ball, &player1);

	if (!collisionPlayer1) {
		collisionPlayer2 = check_collision(&ball, &player2);
	}

	if (collisionPlayer2) {
		ball.x_direction = MOVEMENT_LEFT;
	} else if (collisionPlayer1) {
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

void player_movement(struct Player * player) {
	// Read the controller

	player->pad = pad_poll(player->pad_number);

	// Determine Player movement

	if (player->pad & PAD_UP){
		player->y_direction = MOVEMENT_UP;
	} else if (player->pad & PAD_DOWN){
		player->y_direction = MOVEMENT_DOWN;
	} else {
		return;
	}

	// Check screen limits

	if (player->y_direction == MOVEMENT_UP && player->y <= TOP_LIMIT) {
		return;
	}

	if (player->y_direction == MOVEMENT_DOWN && player->y + player->height >= BOTTOM_LIMIT) {
		return;
	}

	// Move paddle

	if (player->y_direction == MOVEMENT_UP) {
		player->y -= PADDLE_VELOCITY;
	} else {
		player->y += PADDLE_VELOCITY;
	}
}

void draw(void){
    // Clear vram buffer

    clear_vram_buffer();

	// Clear all sprites from sprite buffer

	oam_clear();

	// Draw points

	// NOTE: Here we add 48 to match the # Tile of the corresponding number with the score of the player

	one_vram_buffer(player1.points + 48, NTADR_A(13, 0));
	one_vram_buffer(player2.points + 48, NTADR_A(29, 0));

	// Draw our ball

	oam_meta_spr(ball.x, ball.y, BallSprite);

	// Draw our first player

	oam_meta_spr(player1.x, player1.y, PlayerSprite);

	// Draw our second player

	oam_meta_spr(player2.x, player2.y, PlayerSprite);
}

void main(void) {
	initialize_system();

	show_introduction();

	while (1) {
		// :: Game Loop

		// Wait till beginning of the frame

		ppu_wait_nmi();

		// Determine players movements

		player_movement(&player1);
		player_movement(&player2);

		// Determine ball movement

		ball_movement();

		// Draw everything!

        draw();
	}
}