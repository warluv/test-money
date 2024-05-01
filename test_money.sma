#pragma compress 1

#include <amxmodx>
#include <reapi>

#pragma semicolon 1

new const g_sPrefix[] = "^4[TS]^1";

public plugin_init() 
{
    register_plugin("Test Money", "1.0.0", "WarBans");

    new const cmds[][] = { "say /money", "money" };

    for (new i = 0; i < sizeof(cmds); i++)     
        register_clcmd(cmds[i], "@Command_TestMoney");
}

@Command_TestMoney(id)
{
    rg_add_account(id, 30);

    for (new i = 1; i <= MaxClients; i++)
    {
        if (!is_user_connected(i) || id == i)
            continue;

        client_print_color(i, print_team_default, "%s ^3%n выдал себе^4 30$^1.", g_sPrefix, id);
    }

    client_print_color(id, print_team_default, "%s Вы выдали себе^4 30$^1.", g_sPrefix);
}
