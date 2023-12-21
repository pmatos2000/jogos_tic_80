-- title:   H.E.R.O
-- author:  Paulo Matos
-- desc:    Criação de um remake do Jogo H.E.R.O do Atari no TIC-80
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua


-- Sistema de logs


local logs = {}

local function log_exibir()
	local y = 4
	for d=1,#logs do
		print(logs[d],4,y,4)
		y=y+8
	end
end

local function log_adicionar(log)
	table.insert(logs, log)
end

local function log_limpar()
	logs = {}
end

function OVR()
	log_exibir()
end

local dic_animacao = {
	HERO_PARADO =  {
		frames = {
			{
				id_sprite = 260,
				dx = -8,
				dy = 0,
			},
			{
				id_sprite = 256,
				dx = 0,
				dy = 0,
			},
			{
				id_sprite = 259,
				dx = -8,
				dy = 8,
			},
			{
				id_sprite = 257,
				dx = 0,
				dy = 8,
			},
			{
				id_sprite = 258,
				dx = 0,
				dy = 16,
			},
		}
	}
}

local hero = {
	vida = 3,
	pontos = 0,
	x = 32,
	y = 48,
	animacao_nome = "HERO_PARADO",
	animacao_frame = 0,
	animacao_virar = false,
}



local function desenhar_animacao (animacao_nome, frame, x, y)
	local animacao = dic_animacao[animacao_nome]
	if animacao then
		for i = 1, #animacao.frames do
			frame = animacao.frames[i]
			spr(
				frame.id_sprite,
				frame.dx + x,
				frame.dy + y,
				-1
			)
		end
	else
		log_adicionar("Animacao nao encontrada: " .. animacao_nome);
	end
end



function TIC()
	cls()
	log_limpar()
	desenhar_animacao(hero.animacao_nome, hero.animacao_frame, hero.x, hero.y)
end





-- <TILES>
-- 001:3333333333333333333333333333333333333333333333333333333333333333
-- </TILES>

-- <SPRITES>
-- 000:0022220002222220222223332222333322223333022222200022220000022000
-- 001:0044440004444440544444405445444054454440544544405445554004444440
-- 002:0666666006666660006666000006600000066000000660000006660000066600
-- 003:0055550000555500005555550005555500005555000005550000005500000000
-- 004:7777777700077000000220000002200000022000000220000002200000022000
-- </SPRITES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e5330303041a6f604007dfffffff2c6000000080c040000080c000408000c00180404380404040004
-- </PALETTE>

