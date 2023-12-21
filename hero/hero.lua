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
	for d = 1, #logs do
		print(logs[d], 4, y, 4)
		y = y + 8
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
	HERO_PARADO = {
		largura = 16,
		frames = {
			{
				{
					id_sprite = 260,
					dx = -8,
					dy = -1,
				},
				{
					id_sprite = 256,
					dx = 0,
					dy = 0,
				},
				{
					id_sprite = 259,
					dx = -8,
					dy = 7,
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
	},
	HERO_VOANDO = {
		frames = {
			{
				{
					id_sprite = 260,
					dx = -8,
					dy = -1,
				},
				{
					id_sprite = 256,
					dx = 0,
					dy = 0,
				},
				{
					id_sprite = 259,
					dx = -8,
					dy = 7,
				},
				{
					id_sprite = 257,
					dx = 0,
					dy = 8,
				},
				{
					id_sprite = 274,
					dx = 0,
					dy = 16,
				},
			},
			{
				{
					id_sprite = 261,
					dx = -8,
					dy = -1,
				},
				{
					id_sprite = 256,
					dx = 0,
					dy = 0,
				},
				{
					id_sprite = 259,
					dx = -8,
					dy = 7,
				},
				{
					id_sprite = 257,
					dx = 0,
					dy = 8,
				},
				{
					id_sprite = 274,
					dx = 0,
					dy = 16,
				},
			},
			{
				{
					id_sprite = 262,
					dx = -8,
					dy = -1,
				},
				{
					id_sprite = 256,
					dx = 0,
					dy = 0,
				},
				{
					id_sprite = 259,
					dx = -8,
					dy = 7,
				},
				{
					id_sprite = 257,
					dx = 0,
					dy = 8,
				},
				{
					id_sprite = 274,
					dx = 0,
					dy = 16,
				},
			},
			{
				{
					id_sprite = 261,
					dx = -8,
					dy = -1,
				},
				{
					id_sprite = 256,
					dx = 0,
					dy = 0,
				},
				{
					id_sprite = 259,
					dx = -8,
					dy = 7,
				},
				{
					id_sprite = 257,
					dx = 0,
					dy = 8,
				},
				{
					id_sprite = 274,
					dx = 0,
					dy = 16,
				},
			},
		}
	},
}

local hero = {
	vida = 3,
	pontos = 0,
	x = 32,
	y = 48,
	animacao_nome = "HERO_VOANDO",
	frame_atual = 1,
	animacao_virar = false,
}

local function atualizar_hero()
	if btn(2) then
		hero.x = hero.x - 1;
	end
	if btn(3) then
		hero.x = hero.x + 1;
	end
end


local function desenhar_animacao(obj)
	local animacao = dic_animacao[obj.animacao_nome]
	--Desenha o sprites na tela
	local lista_sprite = animacao.frames[obj.frame_atual]
	for i = 1, #lista_sprite do
		local sprite = lista_sprite[i]
		spr(
			sprite.id_sprite,
			sprite.dx + obj.x,
			sprite.dy + obj.y,
			-1
		)
	end
	--Atualiza o frame da animacao
	if obj.frame_atual == #animacao.frames then
		obj.frame_atual = 1
	else
		obj.frame_atual = obj.frame_atual + 1
	end
end



function TIC()
	cls()
	log_limpar()
	atualizar_hero()
	desenhar_animacao(hero)
end

-- <TILES>
-- 001:3333333333333333333333333333333333333333333333333333333333333333
-- </TILES>

-- <SPRITES>
-- 000:0022220002222220222223332222333322223333022222200022220000022000
-- 001:0044440004444440333344403445344034453740344555403434424003444440
-- 002:0666666006666660006666000006600000066000000660000006660000066600
-- 003:0033330000333300003333300003333300003333000003330000003300000000
-- 004:7777777700077000000220000002200000022000000220000002200000022000
-- 005:0777777000077000000220000002200000022000000220000002200000022000
-- 006:0007700000077000000220000002200000022000000220000002200000022000
-- 018:0666666006666660000666000066600006660000066000000600000000000000
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
-- 000:0800045d275db13e535d202041a6f604007dfffffff2c6000000ff0c040000080c000408000c00180404380404040004
-- </PALETTE>

