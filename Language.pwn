#include <a_samp>
#include <zcmd>

new PlayerLanguage[MAX_PLAYERS];
#define DIALOG_LANGUAGE 1933

stock Message(playerid, color, const Indonesian[], const English[], const Russian[])
{
    if(PlayerLanguage[playerid] == 0) return SendClientMessage(playerid, color, Indonesian);
    if(PlayerLanguage[playerid] == 1) return SendClientMessage(playerid, color, English);
    if(PlayerLanguage[playerid] == 2) return SendClientMessage(playerid, color, Russian);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_LANGUAGE)
    {
        if (response)
        {
            switch(listitem)
            {
                case 0:
                {
                     PlayerLanguage[playerid] = 0;
                     SendClientMessage(playerid, -1, "{a6a6a6}INFO: {ffffff}Bahasa Diubah Ke Bahasa Inggris");
                     return 1;
                 }
                case 1:
                {
                     PlayerLanguage[playerid] = 1;
                     SendClientMessage(playerid, -1, "{a6a6a6}INFO: {ffffff}Language Changed To English");
                     return 1;
                 }
                 case 2:
                {
                     PlayerLanguage[playerid] = 2;
                     SendClientMessage(playerid, -1, "{a6a6a6}INFO: {ffffff}Язык изменен на английский");
                     return 1;
                 }
            }
        }
        return 1; 
    }
    return 0;
}

CMD:changelanguage(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_LANGUAGE, DIALOG_STYLE_LIST, "Select Language", "Indonesian\nEnglish\nRussian", "Select", "");
    return 1;
}

CMD:test(playerid, params[])
{
    Message(playerid, -1, "Fitur Buatan ZyvyN Andreas", "Features Made by ZyvyN Andreas", "Особенности Сделано ZyvyN Andreas");
    return 1;
}