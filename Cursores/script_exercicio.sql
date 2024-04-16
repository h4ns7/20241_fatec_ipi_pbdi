
-- -- Exercicio 1 
-- DO $$

-- -- Criação do cursor
-- DECLARE
--     cur_youtube CURSOR FOR
--         SELECT rank, youtuber
--         FROM tb_youtubers
--         WHERE video_count >= 1000
--         AND category IN ('Sport', 'Music');
 
-- -- Variáveis para armazenar os resultados
-- DECLARE
--     v_rank INTEGER;
--     v_youtuber VARCHAR(255);
 
-- BEGIN
--     -- Abre o cursor
--     OPEN cur_youtube;
 
--     -- Loop para percorrer os resultados
--     LOOP
--         FETCH cur_youtube INTO v_rank, v_youtuber;
--         EXIT WHEN NOT FOUND; -- Sai do loop quando não há mais resultados
 
--         -- Exiba as variaveis
--         RAISE NOTICE 'Rank: %, Youtuber: %', v_rank, v_youtuber;
--     END LOOP;
 
--     -- Fecha o cursor
--     CLOSE cur_youtube;
-- END; 
-- $$


--2 
DO $$
-- Criação do cursor
DECLARE
    cur_youtube CURSOR FOR
        SELECT youtuber
        FROM tb_youtubers
        ORDER BY youtuber DESC;
 
-- Variável para armazenar o nome do youtuber
DECLARE
    v_youtuber VARCHAR(255);
 
BEGIN
    -- Abre o cursor
    OPEN cur_youtube;
 
    -- Loop para percorrer os resultados
    LOOP
        FETCH cur_youtube INTO v_youtuber;
        EXIT WHEN NOT FOUND; -- Sai do loop quando não há mais resultados
 
        -- Exibe o nome do youtuber
        RAISE NOTICE 'Youtuber: %', v_youtuber;
    END LOOP;
 
    -- Fecha o cursor
    CLOSE cur_youtube;
END;
$$