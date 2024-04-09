
DO $$
DECLARE
	n1 INTEGER;
	n2 NUMERIC(3,1);
	n3 NUMERIC(3,1);
	n4 INTEGER;
	a1 NUMERIC(3,1);
	b2 NUMERIC(3,1);
	c3 NUMERIC(3,1);
	
	
BEGIN
	-- 1 <= n < 100 (intervalor inteiro)
	n1:= 1 + floor(random() * 99);
	RAISE NOTICE 'N1: %', n1;
	-- 1 <= n < 10 ( intervalo real )
	n2 := 1 + random() * 9;
	RAISE NOTICE 'N2: %', n2;
	-- >= 20 <= 30 que converta em Fahrenheit
	n2:= 20 + floor(random() * 11);
	n3:= n2 * 1.8 + 32;
	RAISE NOTICE 'Grau Celcius em Fahrenheit : %º', n3;
	
	-- Programa gera 3 valores reais a,b,c e mostre o valor de delta.
	
	a1:= 1 + floor(random()*9);
	b2:= 1 + floor(random()*9);
	c3:= 1 + floor(random()*9);
	RAISE NOTICE 'a = %, b = % e c = %', a1, b2, c3;
	
	n2:= b2^2;
	
	RAISE NOTICE '∆ %', n2 - 4 * (a1 * c3) ;
	
	-- Gere um número inteiro e mostre a raiz cúbica de seu antecessor e a raiz
	-- cúbica de seu antecessor e a raiz quadrada de seu sucesor
	n1:= 1+ floor(random() * 9);
	RAISE NOTICE 'Valor inteiro aleatorio: %', n1;
	n1:= n1 - 1;
	n4:= ||/n1;
	RAISE NOTICE 'Antecessor ∛%', n4;
	n1:= n1 + 2;
	n4:= |/n1;
	RAISE NOTICE 'Sucessor √%', n4;
	
	
	
	
	
	
	
	
	
	
END;
$$