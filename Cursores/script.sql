DO $$
 
DECLARE
	--1. Cursor não vinculado
	cur_delete REFCURSOR;
	tupla RECORD;
 
BEGIN
	--2. Abrindo cursor
	OPEN cur_delete SCROLL FOR
		SELECT * FROM tb_youtubers;
	LOOP 
		-- pego a proxima linha
		FETCH cur_delete INTO tupla;
		-- saio, se for o caso
		EXIT WHEN NOT FOUND;
		-- olho para video_count da tupla
		IF tupla.video_count IS NULL THEN
		-- se for null, faço delete
			DELETE FROM tb_youtubers WHERE CURRENT OF cur_delete;
		END IF;
	END LOOP;
	
 	-- Fazer o loop de baixo para cima, pesquisando na internet
	-- não vale olhar o bloquinho de codigo 2.9.1 da apostila 16
	
	LOOP
		FETCH BACKWARD FROM cur_delete INTO tupla;
		EXIT WHEN NOT FOUND;
		RAISE NOTICE '%', tupla;
	END LOOP;
	CLOSE cur_delete;
END;
$$









--cursor com parâmetros nomeado e por ordem
--exibir nome sdos youtubers que começaram a partir de 2010
-- e pelo menos 60Mi de inscritos

-- mais um bloquinho anônimo



-- DO  $$
-- DECLARE
-- 	v_ano INT := 2010;
-- 	v_inscritos INT:= 60000000;
-- 	cur_ano_inscritos CURSOR(ano INT, inscritos INT) FOR
-- 	SELECT youtuber FROM tb_youtubers WHERE started >= ano AND subscribers >= inscritos;
-- 	v_youtuber VARCHAR (200); 

-- BEGIN
-- 	-- 2. Abertura do cursor
-- 	--essa, passando argumentos pela ordem

-- 	OPEN cur_ano_inscritos( ano:= v_ano, inscritos:= v_inscritos);

-- 	--essa, passando argumentos pelo nome
-- 	--OPEN cur_ano_inscritos( inscritos := v_inscritos, ano:= v_ano);

-- 	LOOP
-- 		-- buscar o nome
-- 			FETCH cur_ano_inscritos INTO v_youtuber;
-- 		-- sair se for o caso
-- 			EXIT WHEN NOT FOUND;
-- 		-- exibir, se puder		
-- 		RAISE NOTICE '%', v_youtuber;
-- 	END LOOP;
-- --4. Fechamento
-- 	CLOSE cur_ano_inscritos;
-- END;
-- $$


-- -- --Cursor vinculado (bound)
-- -- --exibir nome do canal concatenado a seu número de inscritos
-- -- -- mais um bloquinho anônimo

-- -- DO $$
-- -- 	DECLARE
-- -- 		--cursor bound (vinculado)
-- -- 		--1. Declaração (Ainda não está aberto)
-- -- 		cur_nomes_e_inscritos CURSOR FOR
-- -- 		SELECT youtuber, subscribers FROM tb_youtubers;
-- -- 		tupla RECORD;
-- -- 		--tupla.youtuber me dá o youtuber
-- -- 		--tupla.subscribers me dáo número de subscribers
-- -- 		resultado TEXT DEFAULT '';
-- -- 		BEGIN
-- -- 			--2. Abertura do cursor
-- -- 			OPEN cur_nomes_e_inscritos;
-- -- 			--vamos usar o loop WHILE
-- -- 			--3. Recuperação de dados
-- -- 			FETCH cur_nomes_e_inscritos INTO tupla;
-- -- 			WHILE FOUND LOOP
-- -- 				-- concatenação, operador ||
-- -- 				resultado := resultado || tupla.youtuber || ':' || tupla.subscribers ||',';
-- -- 				FETCH cur_nomes_e_inscritos INTO tupla;
-- -- 			END LOOP;
-- -- 			--4.Fechamento
-- -- 			CLOSE cur_nomes_e_inscritos;
-- -- 			RAISE NOTICE '%', resultado;
			
-- -- END;	
-- -- $$

-- -- -- -- bloquinho anônimo

-- -- -- DO $$
-- -- -- DECLARE
-- -- -- 	-- 1. Declaração do cursor
-- -- -- 	cur_nomes_youtubers REFCURSOR;
-- -- -- 	v_youtuber VARCHAR(200);


-- -- -- BEGIN

-- -- -- 	--2. Abertura do cursor
-- -- -- 	OPEN cur_nomes_youtubers FOR
-- -- -- 		SELECT youtuber FROM tb_youtubers;
	
	
-- -- -- 	--3. Recuperação de dados de interesse
-- -- -- 	LOOP
	
-- -- -- 		FETCH cur_nomes_youtubers INTO v_youtuber;
-- -- -- 		EXIT WHEN NOT FOUND;
-- -- -- 		RAISE NOTICE '%', v_youtuber;
		
	
-- -- -- 	END LOOP;

-- -- -- 	--4. Fechar o cursor
	
-- -- -- 	CLOSE cur_nomes_youtubers;

-- -- -- END;
-- -- -- $$

-- -- -- CREATE TABLE tb_youtubers(
-- -- -- 	cod_top_youtubers SERIAL PRIMARY KEY,
-- -- -- 	rank INT,
-- -- -- 	youtuber VARCHAR (200),
-- -- -- 	subscribers INT,
-- -- -- 	video_views VARCHAR(200),
-- -- -- 	video_count INT,
-- -- -- 	category VARCHAR (200),
-- -- -- 	started INT
-- -- -- );

-- -- -- select * from tb_youtubers;

-- -- -- ALTER TABLE tb_youtubers
-- -- -- ALTER COLUMN video_views TYPE BIGINT USING (video_views::BIGINT)

-- -- -- Cursos não vinculado com query dinâmica, ou seja uma query repesentada como uma string 
-- -- -- mais um bloquinho anonimo
-- -- -- DO $$

-- -- -- DECLARE
-- -- -- 	-- 1. Declaração
-- -- -- 	cur_nomes_a_partir_de REFCURSOR;
-- -- -- 	v_youtuber VARCHAR (200);
-- -- -- 	v_ano INT := 2008;
-- -- -- 	v_nome_tabela VARCHAR (200):='tb_youtubers';
	

-- -- -- BEGIN

-- -- -- 	-- 2. Abertura do cursor
-- -- -- 	OPEN cur_nomes_a_partir_de FOR EXECUTE 
-- -- -- 	format(
-- -- -- 		'
-- -- -- 			SELECT 
-- -- -- 				youtuber
-- -- -- 			FROM %s
-- -- -- 			WHERE started >= $1
-- -- -- 		',v_nome_tabela
-- -- -- 	)USING v_ano;
	
-- -- -- 	LOOP
-- -- -- 		--.3Recuperação de dados com FETCH
		
-- -- -- 		FETCH cur_nomes_a_partir_de INTO v_youtuber;
-- -- -- 		EXIT WHEN NOT FOUND;
-- -- -- 		RAISE NOTICE '%', v_youtuber;
	
-- -- -- 	END LOOP;
-- -- -- 	--.4 Fechamento do loop
-- -- -- 	CLOSE cur_nomes_a_partir_de;
-- -- -- END;
-- -- -- $$

