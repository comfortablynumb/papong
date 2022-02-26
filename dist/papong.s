;
; File generated by cc65 v 2.19 - Git d90cd11
;
	.fopt		compiler,"cc65 v 2.19 - Git d90cd11"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_pal_bg
	.import		_pal_spr
	.import		_ppu_wait_nmi
	.import		_ppu_off
	.import		_ppu_on_all
	.import		_oam_clear
	.import		_oam_meta_spr
	.import		_pad_poll
	.import		_bank_spr
	.import		_vram_adr
	.import		_vram_put
	.import		_vram_fill
	.import		_vram_unrle
	.import		_delay
	.import		_set_vram_buffer
	.import		_one_vram_buffer
	.import		_clear_vram_buffer
	.import		_check_collision
	.export		_BLACK
	.export		_LEFT_LIMIT
	.export		_RIGHT_LIMIT
	.export		_TOP_LIMIT
	.export		_BOTTOM_LIMIT
	.export		_MOVEMENT_NONE
	.export		_MOVEMENT_UP
	.export		_MOVEMENT_DOWN
	.export		_MOVEMENT_LEFT
	.export		_MOVEMENT_RIGHT
	.export		_PADDLE_VELOCITY
	.export		_BALL_INITIAL_X
	.export		_BALL_INITIAL_Y
	.export		_BALL_WIDTH
	.export		_BALL_HEIGHT
	.export		_PLAYER_INITIAL_Y
	.export		_PLAYER_WIDTH
	.export		_PLAYER_HEIGHT
	.export		_PLAYER_1_INITIAL_X
	.export		_PLAYER_2_INITIAL_X
	.export		_MAX_POINTS
	.export		_PlayerSprite
	.export		_BallSprite
	.export		_Background
	.export		_palette_bg
	.export		_palette_spr
	.export		_ball
	.export		_player1
	.export		_player2
	.export		_fill_background
	.export		_clear_background
	.export		_show_text
	.export		_show_introduction
	.export		_initialize_system
	.export		_restart_round
	.export		_add_point_to_player
	.export		_ball_movement
	.export		_player_movement
	.export		_draw
	.export		_main

.segment	"DATA"

_ball:
	.byte	$78
	.byte	$78
	.byte	$08
	.byte	$08
	.byte	$04
	.byte	$02
_player1:
	.byte	$1E
	.byte	$50
	.byte	$08
	.byte	$20
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$50,$6C,$61,$79,$65,$72,$20,$31,$20,$57,$49,$4E,$53,$21,$00
_player2:
	.byte	$DA
	.byte	$50
	.byte	$08
	.byte	$20
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$50,$6C,$61,$79,$65,$72,$20,$32,$20,$57,$49,$4E,$53,$21,$00

.segment	"RODATA"

_BLACK:
	.byte	$00
_LEFT_LIMIT:
	.byte	$10
_RIGHT_LIMIT:
	.byte	$F0
_TOP_LIMIT:
	.byte	$10
_BOTTOM_LIMIT:
	.byte	$D6
_MOVEMENT_NONE:
	.byte	$00
_MOVEMENT_UP:
	.byte	$01
_MOVEMENT_DOWN:
	.byte	$02
_MOVEMENT_LEFT:
	.byte	$03
_MOVEMENT_RIGHT:
	.byte	$04
_PADDLE_VELOCITY:
	.byte	$02
_BALL_INITIAL_X:
	.byte	$78
_BALL_INITIAL_Y:
	.byte	$78
_BALL_WIDTH:
	.byte	$08
_BALL_HEIGHT:
	.byte	$08
_PLAYER_INITIAL_Y:
	.byte	$50
_PLAYER_WIDTH:
	.byte	$08
_PLAYER_HEIGHT:
	.byte	$20
_PLAYER_1_INITIAL_X:
	.byte	$1E
_PLAYER_2_INITIAL_X:
	.byte	$DA
_MAX_POINTS:
	.byte	$05
_PlayerSprite:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$10
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$08
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$18
	.byte	$00
	.byte	$01
	.byte	$80
_BallSprite:
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$03
	.byte	$80
_Background:
	.byte	$01
	.byte	$02
	.byte	$02
	.byte	$50
	.byte	$4C
	.byte	$41
	.byte	$59
	.byte	$45
	.byte	$52
	.byte	$20
	.byte	$31
	.byte	$3A
	.byte	$10
	.byte	$01
	.byte	$02
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$50
	.byte	$4C
	.byte	$41
	.byte	$59
	.byte	$45
	.byte	$52
	.byte	$20
	.byte	$32
	.byte	$3A
	.byte	$10
	.byte	$01
	.byte	$02
	.byte	$02
	.byte	$01
	.byte	$23
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$16
	.byte	$10
	.byte	$20
	.byte	$01
	.byte	$03
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$1B
	.byte	$02
	.byte	$01
	.byte	$03
	.byte	$20
	.byte	$01
	.byte	$0E
	.byte	$10
	.byte	$01
	.byte	$08
	.byte	$20
	.byte	$01
	.byte	$03
	.byte	$02
	.byte	$01
	.byte	$39
	.byte	$56
	.byte	$20
	.byte	$01
	.byte	$04
	.byte	$02
	.byte	$01
	.byte	$21
	.byte	$00
	.byte	$01
	.byte	$3E
	.byte	$00
	.byte	$01
	.byte	$00
_palette_bg:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_palette_spr:
	.byte	$0F
	.byte	$00
	.byte	$10
	.byte	$30
	.byte	$0F
	.byte	$11
	.byte	$21
	.byte	$31
	.byte	$0F
	.byte	$06
	.byte	$16
	.byte	$26
	.byte	$0F
	.byte	$09
	.byte	$19
	.byte	$29
S0008:
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$00

; ---------------------------------------------------------------
; void __near__ fill_background (const unsigned char color)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fill_background: near

.segment	"CODE"

;
; void fill_background(const unsigned char color) {
;
	jsr     pusha
;
; ppu_off();
;
	jsr     _ppu_off
;
; vram_fill(color, NTADR_A(0, 0));
;
	ldy     #$00
	lda     (sp),y
	jsr     pusha
	ldx     #$20
	lda     #$00
	jsr     _vram_fill
;
; ppu_on_all();
;
	jsr     _ppu_on_all
;
; }
;
	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; void __near__ clear_background (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_clear_background: near

.segment	"CODE"

;
; fill_background(BLACK);
;
	lda     _BLACK
	jmp     _fill_background

.endproc

; ---------------------------------------------------------------
; void __near__ show_text (const unsigned char *text, int x, int y)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_show_text: near

.segment	"CODE"

;
; void show_text(const unsigned char * text, int x, int y) {
;
	jsr     pushax
;
; ppu_off();
;
	jsr     _ppu_off
;
; pal_bg(palette_bg);
;
	lda     #<(_palette_bg)
	ldx     #>(_palette_bg)
	jsr     _pal_bg
;
; vram_adr(NTADR_A(x, y));
;
	ldy     #$01
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	jsr     aslax4
	stx     tmp1
	asl     a
	rol     tmp1
	sta     ptr1
	ldy     #$03
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ora     ptr1
	pha
	txa
	ora     tmp1
	tax
	pla
	pha
	txa
	ora     #$20
	tax
	pla
	jsr     _vram_adr
;
; i = 0;
;
	lda     #$00
	sta     M0001
;
; while(text[i]) {
;
	jmp     L0004
;
; vram_put(text[i]);
;
L0002:	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     M0001
	sta     ptr1
	stx     ptr1+1
	lda     (ptr1),y
	jsr     _vram_put
;
; ++i;
;
	inc     M0001
;
; while(text[i]) {
;
L0004:	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	ldy     M0001
	sta     ptr1
	stx     ptr1+1
	lda     (ptr1),y
	bne     L0002
;
; ppu_on_all();
;
	jsr     _ppu_on_all
;
; }
;
	jmp     incsp6

.segment	"DATA"

M0001:
	.byte	$00

.endproc

; ---------------------------------------------------------------
; void __near__ show_introduction (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_show_introduction: near

.segment	"CODE"

;
; show_text(version_text, 25, 28);
;
	jsr     decsp4
	lda     #<(M0004)
	ldy     #$02
	sta     (sp),y
	iny
	lda     #>(M0004)
	sta     (sp),y
	lda     #$19
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$1C
	jsr     _show_text
;
; show_text(first_text, 4, 12);
;
	jsr     decsp4
	lda     #<(M0001)
	ldy     #$02
	sta     (sp),y
	iny
	lda     #>(M0001)
	sta     (sp),y
	lda     #$04
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$0C
	jsr     _show_text
;
; delay(100);
;
	lda     #$64
	jsr     _delay
;
; show_text(clear_text, 4, 12);
;
	jsr     decsp4
	lda     #<(M0003)
	ldy     #$02
	sta     (sp),y
	iny
	lda     #>(M0003)
	sta     (sp),y
	lda     #$04
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$0C
	jsr     _show_text
;
; show_text(second_text, 13, 12);
;
	jsr     decsp4
	lda     #<(M0002)
	ldy     #$02
	sta     (sp),y
	iny
	lda     #>(M0002)
	sta     (sp),y
	lda     #$0D
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$0C
	jsr     _show_text
;
; delay(100);
;
	lda     #$64
	jsr     _delay
;
; show_text(clear_text, 4, 12);
;
	jsr     decsp4
	lda     #<(M0003)
	ldy     #$02
	sta     (sp),y
	iny
	lda     #>(M0003)
	sta     (sp),y
	lda     #$04
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$0C
	jmp     _show_text

.segment	"RODATA"

M0001:
	.byte	$4D,$6F,$6C,$6C,$65,$6A,$61,$20,$53,$6F,$66,$74,$20,$70,$72,$65
	.byte	$73,$65,$6E,$74,$73,$2E,$2E,$2E,$00
M0002:
	.byte	$50,$41,$50,$4F,$4E,$47,$00
M0003:
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
	.byte	$20,$20,$20,$20,$20,$20,$20,$20,$00
M0004:
	.byte	$30,$2E,$31,$2E,$32,$00

.endproc

; ---------------------------------------------------------------
; void __near__ initialize_system (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_initialize_system: near

.segment	"CODE"

;
; ppu_off();
;
	jsr     _ppu_off
;
; pal_bg(palette_bg);
;
	lda     #<(_palette_bg)
	ldx     #>(_palette_bg)
	jsr     _pal_bg
;
; pal_spr(palette_spr);
;
	lda     #<(_palette_spr)
	ldx     #>(_palette_spr)
	jsr     _pal_spr
;
; bank_spr(1);
;
	lda     #$01
	jsr     _bank_spr
;
; set_vram_buffer();
;
	jsr     _set_vram_buffer
;
; clear_vram_buffer();
;
	jsr     _clear_vram_buffer
;
; vram_adr(NAMETABLE_A);
;
	ldx     #$20
	lda     #$00
	jsr     _vram_adr
;
; vram_unrle(Background);
;
	lda     #<(_Background)
	ldx     #>(_Background)
	jsr     _vram_unrle
;
; ppu_on_all();
;
	jmp     _ppu_on_all

.endproc

; ---------------------------------------------------------------
; void __near__ restart_round (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_restart_round: near

.segment	"CODE"

;
; player1.y = PLAYER_INITIAL_Y;
;
	lda     _PLAYER_INITIAL_Y
	sta     _player1+1
;
; player2.y = PLAYER_INITIAL_Y;
;
	lda     _PLAYER_INITIAL_Y
	sta     _player2+1
;
; ball.x = BALL_INITIAL_X;
;
	lda     _BALL_INITIAL_X
	sta     _ball
;
; ball.y = BALL_INITIAL_Y;
;
	lda     _BALL_INITIAL_Y
	sta     _ball+1
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ add_point_to_player (struct Player *player)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_add_point_to_player: near

.segment	"CODE"

;
; void add_point_to_player(struct Player * player) {
;
	jsr     pushax
;
; ++(player->points);
;
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$07
	lda     #$01
	clc
	adc     (ptr1),y
	sta     (ptr1),y
;
; if (player->points >= MAX_POINTS) {
;
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$07
	lda     (ptr1),y
	cmp     _MAX_POINTS
	bcc     L0002
;
; show_text(player->player_win_text, 9, 12);
;
	jsr     decsp4
	ldy     #$05
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	clc
	adc     #$08
	bcc     L0003
	inx
L0003:	ldy     #$02
	sta     (sp),y
	iny
	txa
	sta     (sp),y
	lda     #$09
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$0C
	jsr     _show_text
;
; delay(100);
;
	lda     #$64
	jsr     _delay
;
; show_text("              ", 9, 12);
;
	jsr     decsp4
	lda     #<(S0008)
	ldy     #$02
	sta     (sp),y
	iny
	lda     #>(S0008)
	sta     (sp),y
	lda     #$09
	ldy     #$00
	sta     (sp),y
	iny
	lda     #$00
	sta     (sp),y
	tax
	lda     #$0C
	jsr     _show_text
;
; player1.points = 0;
;
	lda     #$00
	sta     _player1+7
;
; player2.points = 0;
;
	sta     _player2+7
;
; delay(100);
;
L0002:	lda     #$64
	jsr     _delay
;
; restart_round();
;
	jsr     _restart_round
;
; }
;
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ ball_movement (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_ball_movement: near

.segment	"CODE"

;
; long collisionPlayer1 = 0;
;
	jsr     pushl0
;
; long collisionPlayer2 = 0;
;
	jsr     pushl0
;
; if (ball.x + ball.width >= RIGHT_LIMIT) {
;
	lda     _ball
	clc
	adc     _ball+2
	bcc     L000F
	ldx     #$01
L000F:	cmp     _RIGHT_LIMIT
	txa
	sbc     #$00
	bvs     L0011
	eor     #$80
L0011:	bpl     L0019
;
; add_point_to_player(&player1);
;
	lda     #<(_player1)
	ldx     #>(_player1)
	jsr     _add_point_to_player
;
; return;
;
	jmp     L000E
;
; if (ball.x <= LEFT_LIMIT) {
;
L0019:	lda     _ball
	cmp     _LEFT_LIMIT
	beq     L0013
	bcs     L0003
;
; add_point_to_player(&player2);
;
L0013:	lda     #<(_player2)
	ldx     #>(_player2)
	jsr     _add_point_to_player
;
; return;
;
	jmp     L000E
;
; collisionPlayer1 = check_collision(&ball, &player1);
;
L0003:	lda     #<(_ball)
	ldx     #>(_ball)
	jsr     pushax
	lda     #<(_player1)
	ldx     #>(_player1)
	jsr     _check_collision
	ldy     #$00
	sty     sreg
	sty     sreg+1
	ldy     #$04
	jsr     steaxysp
;
; if (!collisionPlayer1) {
;
	ldy     #$07
	jsr     ldeaxysp
	jsr     bnegeax
	beq     L0004
;
; collisionPlayer2 = check_collision(&ball, &player2);
;
	lda     #<(_ball)
	ldx     #>(_ball)
	jsr     pushax
	lda     #<(_player2)
	ldx     #>(_player2)
	jsr     _check_collision
	ldy     #$00
	sty     sreg
	sty     sreg+1
	jsr     steax0sp
;
; if (collisionPlayer2) {
;
L0004:	jsr     ldeax0sp
	jsr     tsteax
	beq     L0005
;
; ball.x_direction = MOVEMENT_LEFT;
;
	lda     _MOVEMENT_LEFT
;
; } else if (collisionPlayer1) {
;
	jmp     L0015
L0005:	ldy     #$07
	jsr     ldeaxysp
	jsr     tsteax
	beq     L0007
;
; ball.x_direction = MOVEMENT_RIGHT;
;
	lda     _MOVEMENT_RIGHT
L0015:	sta     _ball+4
;
; if (ball.y + ball.height >= BOTTOM_LIMIT) {
;
L0007:	ldx     #$00
	lda     _ball+1
	clc
	adc     _ball+3
	bcc     L0010
	inx
L0010:	cmp     _BOTTOM_LIMIT
	txa
	sbc     #$00
	bvs     L0012
	eor     #$80
L0012:	bpl     L001A
;
; ball.y_direction = MOVEMENT_UP;
;
	lda     _MOVEMENT_UP
;
; } else if (ball.y <= TOP_LIMIT) {
;
	jmp     L0016
L001A:	lda     _ball+1
	cmp     _TOP_LIMIT
	beq     L001B
	bcs     L001C
;
; ball.y_direction = MOVEMENT_DOWN;
;
L001B:	lda     _MOVEMENT_DOWN
L0016:	sta     _ball+5
;
; if (ball.x_direction == MOVEMENT_LEFT) {
;
L001C:	lda     _ball+4
	cmp     _MOVEMENT_LEFT
	bne     L001D
;
; ball.x -= 1;
;
	dec     _ball
;
; } else {
;
	jmp     L0017
;
; ball.x += 1;
;
L001D:	inc     _ball
;
; if (ball.y_direction == MOVEMENT_UP) {
;
L0017:	lda     _ball+5
	cmp     _MOVEMENT_UP
	bne     L001E
;
; ball.y -= 1;
;
	dec     _ball+1
;
; } else {
;
	jmp     L000E
;
; ball.y += 1;
;
L001E:	inc     _ball+1
;
; }
;
L000E:	jmp     incsp8

.endproc

; ---------------------------------------------------------------
; void __near__ player_movement (struct Player *player)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_player_movement: near

.segment	"CODE"

;
; void player_movement(struct Player * player) {
;
	jsr     pushax
;
; player->pad = pad_poll(player->pad_number);
;
	jsr     pushw0sp
	ldy     #$03
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$06
	lda     (ptr1),y
	jsr     _pad_poll
	ldy     #$05
	jsr     staspidx
;
; if (player->pad & PAD_UP){
;
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$05
	lda     (ptr1),y
	and     #$08
	beq     L0002
;
; player->y_direction = MOVEMENT_UP;
;
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	lda     _MOVEMENT_UP
;
; } else if (player->pad & PAD_DOWN){
;
	jmp     L001A
L0002:	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$05
	lda     (ptr1),y
	and     #$04
	jeq     L000F
;
; player->y_direction = MOVEMENT_DOWN;
;
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	lda     _MOVEMENT_DOWN
L001A:	ldy     #$04
	sta     (ptr1),y
;
; if (player->y_direction == MOVEMENT_UP && player->y <= TOP_LIMIT) {
;
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$04
	lda     (ptr1),y
	cmp     _MOVEMENT_UP
	bne     L0006
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	iny
	lda     (ptr1),y
	cmp     _TOP_LIMIT
	jcc     L000F
	jeq     L000F
	jmp     L0019
;
; if (player->y_direction == MOVEMENT_DOWN && player->y + player->height >= BOTTOM_LIMIT) {
;
L0006:	ldy     #$01
L0019:	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$04
	lda     (ptr1),y
	cmp     _MOVEMENT_DOWN
	bne     L000A
	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	iny
	lda     (ptr1),y
	sta     sreg
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$03
	ldx     #$00
	lda     (ptr1),y
	clc
	adc     sreg
	bcc     L0011
	inx
L0011:	cmp     _BOTTOM_LIMIT
	txa
	sbc     #$00
	bvs     L0012
	eor     #$80
L0012:	bmi     L000F
;
; if (player->y_direction == MOVEMENT_UP) {
;
L000A:	ldy     #$01
	lda     (sp),y
	sta     ptr1+1
	dey
	lda     (sp),y
	sta     ptr1
	ldy     #$04
	lda     (ptr1),y
	cmp     _MOVEMENT_UP
	bne     L000E
;
; player->y -= PADDLE_VELOCITY;
;
	ldy     #$01
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	sta     sreg
	stx     sreg+1
	sta     ptr1
	stx     ptr1+1
	iny
	lda     (ptr1),y
	sec
	sbc     _PADDLE_VELOCITY
;
; } else {
;
	jmp     L0013
;
; player->y += PADDLE_VELOCITY;
;
L000E:	ldy     #$01
	lda     (sp),y
	tax
	dey
	lda     (sp),y
	sta     sreg
	stx     sreg+1
	sta     ptr1
	stx     ptr1+1
	iny
	lda     (ptr1),y
	clc
	adc     _PADDLE_VELOCITY
L0013:	sta     (sreg),y
;
; }
;
L000F:	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ draw (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_draw: near

.segment	"CODE"

;
; clear_vram_buffer();
;
	jsr     _clear_vram_buffer
;
; oam_clear();
;
	jsr     _oam_clear
;
; one_vram_buffer(player1.points + 48, NTADR_A(13, 0));
;
	lda     _player1+7
	clc
	adc     #$30
	jsr     pusha
	ldx     #$20
	lda     #$0D
	jsr     _one_vram_buffer
;
; one_vram_buffer(player2.points + 48, NTADR_A(29, 0));
;
	lda     _player2+7
	clc
	adc     #$30
	jsr     pusha
	ldx     #$20
	lda     #$1D
	jsr     _one_vram_buffer
;
; oam_meta_spr(ball.x, ball.y, BallSprite);
;
	jsr     decsp2
	lda     _ball
	ldy     #$01
	sta     (sp),y
	lda     _ball+1
	dey
	sta     (sp),y
	lda     #<(_BallSprite)
	ldx     #>(_BallSprite)
	jsr     _oam_meta_spr
;
; oam_meta_spr(player1.x, player1.y, PlayerSprite);
;
	jsr     decsp2
	lda     _player1
	ldy     #$01
	sta     (sp),y
	lda     _player1+1
	dey
	sta     (sp),y
	lda     #<(_PlayerSprite)
	ldx     #>(_PlayerSprite)
	jsr     _oam_meta_spr
;
; oam_meta_spr(player2.x, player2.y, PlayerSprite);
;
	jsr     decsp2
	lda     _player2
	ldy     #$01
	sta     (sp),y
	lda     _player2+1
	dey
	sta     (sp),y
	lda     #<(_PlayerSprite)
	ldx     #>(_PlayerSprite)
	jmp     _oam_meta_spr

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; initialize_system();
;
	jsr     _initialize_system
;
; show_introduction();
;
	jsr     _show_introduction
;
; ppu_wait_nmi();
;
L0002:	jsr     _ppu_wait_nmi
;
; player_movement(&player1);
;
	lda     #<(_player1)
	ldx     #>(_player1)
	jsr     _player_movement
;
; player_movement(&player2);
;
	lda     #<(_player2)
	ldx     #>(_player2)
	jsr     _player_movement
;
; ball_movement();
;
	jsr     _ball_movement
;
; draw();
;
	jsr     _draw
;
; while (1) {
;
	jmp     L0002

.endproc

