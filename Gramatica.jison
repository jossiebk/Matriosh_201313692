/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++ DEFINICION LEXICA +++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
%lex

%options case-insensitive

%%

\s+											// se ignoran espacios en blanco
"//".*										// comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			// comentario multiple líneas

"+"					return 'MAS';
"-"					return 'MENOS';
"*"					return 'POR';
"/"					return 'DIVIDIDO';
"^"					return 'POTENCIA';
"("					return 'PARIZQ';
")"					return 'PARDER';
"{"					return 'LLAVIZQ';
"}"					return 'LLAVDER';
"?"					return 'CONCAT';
";"					return 'PUNTOYCOMA';
":"					return 'DOSPUNTOS';
"."					return 'PUNTO';
","					return 'COMA';
"="					return 'IGUAL';
"=="					return 'IGUALIGUAL';
"!="					return 'DIFERENTE';
"<"					return 'MENOR';
">"					return 'MAYOR';
"<="					return 'MENORIGUAL';
">="					return 'MAYORIGUAL';
"["					return 'CORCHETEIZQ';
"]"					return 'CORCHETEDER';
"!"					return 'NOT';
"%"					return 'MODULO';
"++"					return 'INCREMENTO';
"--"					return 'DECREMENTO';
"&&"					return 'AND';
"||"					return 'OR';

"\\\""					return 'LLAVDER';
"\\"					return 'LLAVDER';
"\\n"					return 'LLAVDER';
"\\r"					return 'LLAVDER';
"\\t"					return 'LLAVDER';

//palabras reservadas
"var"			return 'JVAR';
"let"			return 'JLET';
"const"			return 'JCONST';
"number"			return 'JNUMBER';
"string"			return 'JSTRING';
"boolean"			return 'JBOOLEAN';
"true"			return 'JTRUE';
"false"			return 'JFALSE';
"void"			return 'JVOID';
"types"			return 'JTYPES';
"Array"			return 'JARRAY';
"if"			return 'JIF';
"else"			return 'JELSE';
"switch"			return 'JSWITCH';
"case"			return 'JCASE';
"while"			return 'JWHILE';
"do"			return 'JDO';
"in"			return 'JIN';
"of"			return 'JOF';
"break"			return 'JBREAK';
"continue"			return 'JCONTINUE';
"return"			return 'JRETURN';
"default"			return 'JDEFAULT';
"console"			return 'JCONSOLE';
"log"			return 'JLOG';
"graficar_ts"			return 'JGRAFICAR';
"push"			return 'JPUSH';
"pop"			return 'JPOP';
"Length"			return 'JLENGTH';
"function"			return 'JFUNCTION';


// expresiones regulares
\"[^\"]*\"				{ yytext = yytext.substr(1,yyleng-2); return 'CADENA1'; }
\'[^\"]*\'				{ yytext = yytext.substr(1,yyleng-2); return 'CADENA2'; }
[0-9]+("."[0-9]+)?\b  	return 'DECIMAL';
[0-9]+\b				return 'ENTERO';
([a-zA-Z])[a-zA-Z0-9_]*	return 'IDENTIFICADOR';


<<EOF>>				return 'EOF';
.					{ console.error('Este es un error léxico: ' + yytext + ', en la linea: ' + yylloc.first_line + ', en la columna: ' + yylloc.first_column); }
/lex
