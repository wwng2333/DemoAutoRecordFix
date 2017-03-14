#include<sourcemod>
#define PLUGIN_VERSION "1.0.0"

public Plugin:myinfo =
{
    name = "Auto-Record",
    author = "XinSheng, wwng",
    description = "La flenda TV_record",
    version = PLUGIN_VERSION,
    url = "http://csgo.help"
};

public OnPluginStart()
{
	RegConsoleCmd("sm_layou_record", LayouRecordAdminCmd);
}

public Action:LayouRecordAdminCmd(client, args)
{
    new String:RecordTime[32],
        String:map[128];

    FormatTime(RecordTime, sizeof(RecordTime), "%Y%m%d%H%M%S");
    GetCurrentMap(map,sizeof(map));

    ReplaceString(map,sizeof(map),"/","_");

	ServerCommand("tv_stoprecord");
    ServerCommand("tv_record %s_%s", RecordTime, map);
    PrintToChatAll(" \x04[系统] \x01GLHF!");
}
