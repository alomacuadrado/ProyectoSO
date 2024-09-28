#include <mysql.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	MYSQL *conn;
	int err;
	MYSQL_RES *result;
	MYSQL_ROW row;
	
	// Inicializar la conexión a MySQL
	conn = mysql_init(NULL);
	if (conn == NULL) {
		printf("Error creando la conexión: %s\n", mysql_error(conn));
		exit(1);
	}
	// Conectar a la base de datos
	conn = mysql_real_connect(conn, "localhost", "root", "mysql", "Championship", 0, NULL, 0);
	if (conn == NULL) {
		printf("Error inicializando la conexión: %s\n", mysql_error(conn));
		exit(1);
	}
	
	// Solicitar el identificador del partido
	char id_m[20];
	printf("Dame el identificador del partido\n");
	scanf("%s", id_m);
	// Construir la consulta SQL
	char query[256];
	sprintf(query, "SELECT Player.username FROM Player, Game, Participation WHERE Player.id_p = Game.winner AND Participation.Game = Game.id_m AND Game.id_m = %s;", id_m);
	// Ejecutar la consulta
	err = mysql_query(conn, query);
	if (err != 0) {
		printf("Error al consultar la base de datos: %u %s\n", mysql_errno(conn), mysql_error(conn));
		mysql_close(conn);
		exit(1);
	}
	result = mysql_store_result(conn);
	if (result == NULL) {
		printf("Error almacenando el resultado: %u %s\n", mysql_errno(conn), mysql_error(conn));
		mysql_close(conn);
		exit(1);
	}
	row = mysql_fetch_row(result);
	if (row == NULL) {
		printf("No data\n");
	} else {
	
			printf("Winner: %s\n", row[0]);
		
	}
	mysql_free_result(result);
	mysql_close(conn);
	
	return 0;
}