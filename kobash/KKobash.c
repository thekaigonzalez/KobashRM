
#include <lua5.4/lua.h>
#include <lua5.4/lualib.h>
#include <lua5.4/lauxlib.h>

int main(int argc, char ** argv) { // NOLINT(bugprone-reserved-identifier)
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    if (luaL_dofile(L, "kobash-mac/kobashMain.dylib") == 1)
    {
        fprintf(stderr,"luaL_dofile failed: %s\n",lua_tostring(L,-1));
    }
}
