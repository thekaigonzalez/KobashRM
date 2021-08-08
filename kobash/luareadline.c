
#include <lua5.4/lua.h>
#include <lua5.4/lualib.h>
#include <lua5.4/lauxlib.h>
#include <readline/readline.h>
#include <readline/history.h>
int lDReadline(lua_State* L)
{
    char* readstr = readline(luaL_checkstring(L, 1));

    add_history(readstr);

    lua_pushstring(L, readstr);
    return 1;
}

int luaopen_readline(lua_State* L) {
    lua_register(L, "readline", lDReadline); /* readline */
    return 1;
}