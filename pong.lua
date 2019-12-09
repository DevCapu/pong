  -- title:  Pong
  -- author: DevCapu
  -- desc:   short description
  -- script: lua


  SCREEN_Y = 130
  SCREEN_X = 240

  jogador = {
  	x = 10,
  	y = SCREEN_Y / 2,
  	tamanhoY = 16,
  	tamanhoX = 2,
  	pontos = 0
  }

  jogadorDois = {
  	x = 230,
  	y = 120,
  	tamanhoY = 16,
  	tamanhoX = 2,
  	pontos = 0
  }

  bolinha = {
  	 x = 90,
  		y = 90,
  		dx = -1,
  		dy = 1
  }

  function TIC()
  	cls(0)
  	verificaLimites()
    verficaMovimentacaoDoJogagador()
  	desenhaJogador()
  	atualizaBolinha()
  	colisaoBolinhaJogador()
    colisaoJogadorDois()
    verificaLimiteBolinha()
  	desenhaBolinha()
    if(marcouPonto()) then
      bolinha.x = 90
      bolinha.y = 90
    end
  	print("PONG!",100,120)
    print('Pontos: '..jogador.pontos, 15, 120)
    print('Pontos: '..jogadorDois.pontos, 180, 120)

  end

  function atualizaBolinha()
  	bolinha.x = bolinha.x + bolinha.dx
  	bolinha.y = bolinha.y + bolinha.dy
  end

  function colisaoBolinhaJogador()
  	if bolinha.x == (jogador.x + (jogador.tamanhoX + 1)) then
  		if ((bolinha.y >= jogador.y) or (bolinha.y + 2 >= jogador.y)) and bolinha.y <= (jogador.y + jogador.tamanhoY) then
  			bolinha.dx = bolinha.dx * -1
  		end
  	end
  end

  function marcouPonto()
    if(bolinha.x < jogador.x) then
      jogadorDois.pontos = jogadorDois.pontos + 2
      return true
    elseif bolinha.x + 2 > jogadorDois.x + jogadorDois.tamanhoX then
      jogador.pontos = jogador.pontos + 1
      return true
    end
  end

  function colisaoJogadorDois()
  if bolinha.x == (jogadorDois.x - 1) then
    if bolinha.y >= jogadorDois.y and bolinha.y <= (jogadorDois.y + jogadorDois.tamanhoY) then
      bolinha.dx = bolinha.dx * -1
    end
  end
  end

  function desenhaBolinha()
  		spr(1,bolinha.x + bolinha.dx / 2,bolinha.y + bolinha.dy / 2,0,3,0,0,1,1)
  end


  function desenhaJogador()
  	spr(0,jogador.x,jogador.y,0,3,0,0,1,1)
  	spr(0,jogadorDois.x,jogadorDois.y,0,3,0,0,1,1)
  end

  function verficaMovimentacaoDoJogagador()
  	if key(23) then jogador.y=jogador.y-1 end
  	if key(19) then jogador.y=jogador.y+1 end
    if btn(0) then jogadorDois.y = jogadorDois.y - 1 end
    if btn(01) then jogadorDois.y = jogadorDois.y + 1 end
  end

  function verificaLimiteSuperior()
  	if jogador.y <= 0 then
  		jogador.y = jogador.y +1
  	end
    if jogadorDois.y <= 0 then
  		jogadorDois.y = jogadorDois.y +1
  	end
  end

  function verificaLimiteInferior()
  	if (jogador.y + 16) >= SCREEN_Y then
  		jogador.y = jogador.y - 1
  	end
    if (jogadorDois.y + 16) >= SCREEN_Y then
  		jogadorDois.y = jogadorDois.y - 1
  	end
  end

  function verificaLimiteBolinhaSuperior()
  	if bolinha.y <= 0 then
  		bolinha.dy = bolinha.dy * -1
  	end
  end

  function verificaLimiteBolinhaInferior()
  	if (bolinha.y + 2) >= SCREEN_Y then
  		bolinha.dy = bolinha.dy * -1
  	end
  end

  function verificaLimiteBolinha()
    verificaLimiteBolinhaInferior()
    verificaLimiteBolinhaSuperior()
  end

  function verificaLimites()
  	verificaLimiteInferior()
  	verificaLimiteSuperior()
  end
