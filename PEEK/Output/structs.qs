
//packet = 0x64
function PACKET_CA_LOGIN() {
	var result = 'PACKET_CA_LOGIN {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Passwd = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x65
function PACKET_CH_ENTER() {
	var result = 'PACKET_CH_ENTER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    userLevel = ' + parser.fetchDWord() + '\n';
	result += '    clientType = ' + parser.fetchWord() + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x66
function PACKET_CH_SELECT_CHAR() {
	var result = 'PACKET_CH_SELECT_CHAR {\n';
	result += '    CharNum = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x67
function PACKET_CH_MAKE_CHAR() {
	var result = 'PACKET_CH_MAKE_CHAR {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Str = ' + parser.fetchByte() + '\n';
	result += '    Agi = ' + parser.fetchByte() + '\n';
	result += '    Vit = ' + parser.fetchByte() + '\n';
	result += '    Int = ' + parser.fetchByte() + '\n';
	result += '    Dex = ' + parser.fetchByte() + '\n';
	result += '    Luk = ' + parser.fetchByte() + '\n';
	result += '    CharNum = ' + parser.fetchByte() + '\n';
	result += '    headPal = ' + parser.fetchWord() + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x68
function PACKET_CH_DELETE_CHAR() {
	var result = 'PACKET_CH_DELETE_CHAR {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    key = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x69
function PACKET_AC_ACCEPT_LOGIN() {
	var result = 'PACKET_AC_ACCEPT_LOGIN {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    userLevel = ' + parser.fetchDWord() + '\n';
	result += '    lastLoginIP = ' + parser.fetchDWord() + '\n';
	result += '    lastLoginTime = ' + '"' + parser.fetchString(26) + '"' + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	{
		var ServerList = parser.remainingLength()/32;
		for (var i = 0; i < ServerList; i++) {
			result += '    SERVER_ADDR ServerList[' + i + '] {\n';
			result += '        ip = ' + getIPAddress() + '\n';
			result += '        port = ' + parser.fetchWord() + '\n';
			result += '        name = ' + '"' + parser.fetchString(20) + '"' + '\n';
			result += '        usercount = ' + parser.fetchWord() + '\n';
			result += '        state = ' + parser.fetchWord() + '\n';
			result += '        property = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x6a
function PACKET_AC_REFUSE_LOGIN() {
	var result = 'PACKET_AC_REFUSE_LOGIN {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '    blockDate = ' + '"' + parser.fetchString(20) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x6b
function PACKET_HC_ACCEPT_ENTER_NEO_UNION() {
	var result = 'PACKET_HC_ACCEPT_ENTER_NEO_UNION {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    TotalSlotNum = ' + parser.fetchByte() + '\n';
	result += '    PremiumStartSlot = ' + parser.fetchByte() + '\n';
	result += '    PremiumEndSlot = ' + parser.fetchByte() + '\n';
	result += '    dummy1_beginbilling = ' + parser.fetchByte() + '\n';
	result += '    code = ' + parser.fetchDWord() + '\n';
	result += '    time1 = ' + parser.fetchDWord() + '\n';
	result += '    time2 = ' + parser.fetchDWord() + '\n';
	result += '    dummy2_endbilling = ' + '"' + parser.fetchString(7) + '"' + '\n';
	{
		var charInfo = parser.remainingLength()/144;
		for (var i = 0; i < charInfo; i++) {
			result += '    CHARACTER_INFO_NEO_UNION charInfo[' + i + '] {\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        exp = ' + parser.fetchDWord() + '\n';
			result += '        money = ' + parser.fetchDWord() + '\n';
			result += '        jobexp = ' + parser.fetchDWord() + '\n';
			result += '        joblevel = ' + parser.fetchDWord() + '\n';
			result += '        bodystate = ' + parser.fetchDWord() + '\n';
			result += '        healthstate = ' + parser.fetchDWord() + '\n';
			result += '        effectstate = ' + parser.fetchDWord() + '\n';
			result += '        virtue = ' + parser.fetchDWord() + '\n';
			result += '        honor = ' + parser.fetchDWord() + '\n';
			result += '        jobpoint = ' + parser.fetchWord() + '\n';
			result += '        hp = ' + parser.fetchDWord() + '\n';
			result += '        maxhp = ' + parser.fetchDWord() + '\n';
			result += '        sp = ' + parser.fetchWord() + '\n';
			result += '        maxsp = ' + parser.fetchWord() + '\n';
			result += '        speed = ' + parser.fetchWord() + '\n';
			result += '        job = ' + getJobInfo(2) + '\n';
			result += '        head = ' + parser.fetchWord() + '\n';
			result += '        weapon = ' + parser.fetchWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        sppoint = ' + parser.fetchWord() + '\n';
			result += '        accessory = ' + parser.fetchWord() + '\n';
			result += '        shield = ' + parser.fetchWord() + '\n';
			result += '        accessory2 = ' + parser.fetchWord() + '\n';
			result += '        accessory3 = ' + parser.fetchWord() + '\n';
			result += '        headpalette = ' + parser.fetchWord() + '\n';
			result += '        bodypalette = ' + parser.fetchWord() + '\n';
			result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        Str = ' + parser.fetchByte() + '\n';
			result += '        Agi = ' + parser.fetchByte() + '\n';
			result += '        Vit = ' + parser.fetchByte() + '\n';
			result += '        Int = ' + parser.fetchByte() + '\n';
			result += '        Dex = ' + parser.fetchByte() + '\n';
			result += '        Luk = ' + parser.fetchByte() + '\n';
			result += '        CharNum = ' + parser.fetchByte() + '\n';
			result += '        haircolor = ' + parser.fetchByte() + '\n';
			result += '        bIsChangedCharName = ' + parser.fetchWord() + '\n';
			result += '        lastMap = ' + '"' + parser.fetchString(16) + '"' + '\n';
			result += '        DeleteDate = ' + parser.fetchDWord() + '\n';
			result += '        Robe = ' + parser.fetchDWord() + '\n';
			result += '        SlotAddon = ' + parser.fetchDWord() + '\n';
			result += '        RenameAddon = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x6c
function PACKET_HC_REFUSE_ENTER() {
	var result = 'PACKET_HC_REFUSE_ENTER {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x6d
function PACKET_HC_ACCEPT_MAKECHAR_NEO_UNION() {
	var result = 'PACKET_HC_ACCEPT_MAKECHAR_NEO_UNION {\n';
	{
		result += '    CHARACTER_INFO_NEO_UNION charinfo {\n';
		result += '        GID = ' + parser.fetchDWord() + '\n';
		result += '        exp = ' + parser.fetchDWord() + '\n';
		result += '        money = ' + parser.fetchDWord() + '\n';
		result += '        jobexp = ' + parser.fetchDWord() + '\n';
		result += '        joblevel = ' + parser.fetchDWord() + '\n';
		result += '        bodystate = ' + parser.fetchDWord() + '\n';
		result += '        healthstate = ' + parser.fetchDWord() + '\n';
		result += '        effectstate = ' + parser.fetchDWord() + '\n';
		result += '        virtue = ' + parser.fetchDWord() + '\n';
		result += '        honor = ' + parser.fetchDWord() + '\n';
		result += '        jobpoint = ' + parser.fetchWord() + '\n';
		result += '        hp = ' + parser.fetchDWord() + '\n';
		result += '        maxhp = ' + parser.fetchDWord() + '\n';
		result += '        sp = ' + parser.fetchWord() + '\n';
		result += '        maxsp = ' + parser.fetchWord() + '\n';
		result += '        speed = ' + parser.fetchWord() + '\n';
		result += '        job = ' + getJobInfo(2) + '\n';
		result += '        head = ' + parser.fetchWord() + '\n';
		result += '        weapon = ' + parser.fetchWord() + '\n';
		result += '        level = ' + parser.fetchWord() + '\n';
		result += '        sppoint = ' + parser.fetchWord() + '\n';
		result += '        accessory = ' + parser.fetchWord() + '\n';
		result += '        shield = ' + parser.fetchWord() + '\n';
		result += '        accessory2 = ' + parser.fetchWord() + '\n';
		result += '        accessory3 = ' + parser.fetchWord() + '\n';
		result += '        headpalette = ' + parser.fetchWord() + '\n';
		result += '        bodypalette = ' + parser.fetchWord() + '\n';
		result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '        Str = ' + parser.fetchByte() + '\n';
		result += '        Agi = ' + parser.fetchByte() + '\n';
		result += '        Vit = ' + parser.fetchByte() + '\n';
		result += '        Int = ' + parser.fetchByte() + '\n';
		result += '        Dex = ' + parser.fetchByte() + '\n';
		result += '        Luk = ' + parser.fetchByte() + '\n';
		result += '        CharNum = ' + parser.fetchByte() + '\n';
		result += '        haircolor = ' + parser.fetchByte() + '\n';
		result += '        bIsChangedCharName = ' + parser.fetchWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x6e
function PACKET_HC_REFUSE_MAKECHAR() {
	var result = 'PACKET_HC_REFUSE_MAKECHAR {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x6f
function PACKET_HC_ACCEPT_DELETECHAR() {
	var result = 'PACKET_HC_ACCEPT_DELETECHAR {\n';
	result += '}\n';
	return result;
}

//packet = 0x70
function PACKET_HC_REFUSE_DELETECHAR() {
	var result = 'PACKET_HC_REFUSE_DELETECHAR {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x71
function PACKET_HC_NOTIFY_ZONESVR() {
	var result = 'PACKET_HC_NOTIFY_ZONESVR {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	{
		result += '    ZSERVER_ADDR addr {\n';
		result += '        ip = ' + getIPAddress() + '\n';
		result += '        port = ' + parser.fetchWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x72
function PACKET_CZ_ENTER() {
	var result = 'PACKET_CZ_ENTER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    clientTime = ' + parser.fetchDWord() + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x73
function PACKET_ZC_ACCEPT_ENTER() {
	var result = 'PACKET_ZC_ACCEPT_ENTER {\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x74
function PACKET_ZC_REFUSE_ENTER() {
	var result = 'PACKET_ZC_REFUSE_ENTER {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x75
function PACKET_ZC_NOTIFY_INITCHAR() {
	var result = 'PACKET_ZC_NOTIFY_INITCHAR {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Style = ' + parser.fetchWord() + '\n';
	result += '    Item = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x76
function PACKET_ZC_NOTIFY_UPDATECHAR() {
	var result = 'PACKET_ZC_NOTIFY_UPDATECHAR {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Style = ' + parser.fetchWord() + '\n';
	result += '    Item = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x77
function PACKET_ZC_NOTIFY_UPDATEPLAYER() {
	var result = 'PACKET_ZC_NOTIFY_UPDATEPLAYER {\n';
	result += '    Style = ' + parser.fetchWord() + '\n';
	result += '    Item = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x78
function PACKET_ZC_NOTIFY_STANDENTRY() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY {\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    shield = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x79
function PACKET_ZC_NOTIFY_NEWENTRY() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    shield = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7a
function PACKET_ZC_NOTIFY_ACTENTRY() {
	var result = 'PACKET_ZC_NOTIFY_ACTENTRY {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    shield = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '    actStartTime = ' + parser.fetchDWord() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7b
function PACKET_ZC_NOTIFY_MOVEENTRY() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    shield = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7c
function PACKET_ZC_NOTIFY_STANDENTRY_NPC() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY_NPC {\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    shield = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d
function PACKET_CZ_NOTIFY_ACTORINIT() {
	var result = 'PACKET_CZ_NOTIFY_ACTORINIT {\n';
	result += '}\n';
	return result;
}

//packet = 0x7e
function PACKET_CZ_REQUEST_TIME() {
	var result = 'PACKET_CZ_REQUEST_TIME {\n';
	result += '    clientTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f
function PACKET_ZC_NOTIFY_TIME() {
	var result = 'PACKET_ZC_NOTIFY_TIME {\n';
	result += '    time = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x80
function PACKET_ZC_NOTIFY_VANISH() {
	var result = 'PACKET_ZC_NOTIFY_VANISH {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x81
function PACKET_SC_NOTIFY_BAN() {
	var result = 'PACKET_SC_NOTIFY_BAN {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x82
function PACKET_CZ_REQUEST_QUIT() {
	var result = 'PACKET_CZ_REQUEST_QUIT {\n';
	result += '}\n';
	return result;
}

//packet = 0x83
function PACKET_ZC_ACCEPT_QUIT() {
	var result = 'PACKET_ZC_ACCEPT_QUIT {\n';
	result += '}\n';
	return result;
}

//packet = 0x84
function PACKET_ZC_REFUSE_QUIT() {
	var result = 'PACKET_ZC_REFUSE_QUIT {\n';
	result += '}\n';
	return result;
}

//packet = 0x85
function PACKET_CZ_REQUEST_MOVE() {
	var result = 'PACKET_CZ_REQUEST_MOVE {\n';
	result += '    dest = ' + getPos() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x86
function PACKET_ZC_NOTIFY_MOVE() {
	var result = 'PACKET_ZC_NOTIFY_MOVE {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x87
function PACKET_ZC_NOTIFY_PLAYERMOVE() {
	var result = 'PACKET_ZC_NOTIFY_PLAYERMOVE {\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x88
function PACKET_ZC_STOPMOVE() {
	var result = 'PACKET_ZC_STOPMOVE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x89
function PACKET_CZ_REQUEST_ACT() {
	var result = 'PACKET_CZ_REQUEST_ACT {\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8a
function PACKET_ZC_NOTIFY_ACT() {
	var result = 'PACKET_ZC_NOTIFY_ACT {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    attackMT = ' + parser.fetchDWord() + '\n';
	result += '    attackedMT = ' + parser.fetchDWord() + '\n';
	result += '    damage = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '    leftDamage = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b
function PACKET_ZC_NOTIFY_ACT_POSITION() {
	var result = 'PACKET_ZC_NOTIFY_ACT_POSITION {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    damage = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c
function PACKET_CZ_REQUEST_CHAT() {
	var result = 'PACKET_CZ_REQUEST_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d
function PACKET_ZC_NOTIFY_CHAT() {
	var result = 'PACKET_ZC_NOTIFY_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e
function PACKET_ZC_NOTIFY_PLAYERCHAT() {
	var result = 'PACKET_ZC_NOTIFY_PLAYERCHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f
function PACKET_SERVER_ENTRY_ACK() {
	var result = 'PACKET_SERVER_ENTRY_ACK {\n';
	result += '    Header = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x90
function PACKET_CZ_CONTACTNPC() {
	var result = 'PACKET_CZ_CONTACTNPC {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x91
function PACKET_ZC_NPCACK_MAPMOVE() {
	var result = 'PACKET_ZC_NPCACK_MAPMOVE {\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x92
function PACKET_ZC_NPCACK_SERVERMOVE() {
	var result = 'PACKET_ZC_NPCACK_SERVERMOVE {\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	{
		result += '    ZSERVER_ADDR addr {\n';
		result += '        ip = ' + getIPAddress() + '\n';
		result += '        port = ' + parser.fetchWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x93
function PACKET_ZC_NPCACK_ENABLE() {
	var result = 'PACKET_ZC_NPCACK_ENABLE {\n';
	result += '}\n';
	return result;
}

//packet = 0x94
function PACKET_CZ_REQNAME() {
	var result = 'PACKET_CZ_REQNAME {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x95
function PACKET_ZC_ACK_REQNAME() {
	var result = 'PACKET_ZC_ACK_REQNAME {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    CName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x96
function PACKET_CZ_WHISPER() {
	var result = 'PACKET_CZ_WHISPER {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    receiver = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x97
function PACKET_ZC_WHISPER() {
	var result = 'PACKET_ZC_WHISPER {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    sender = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x98
function PACKET_ZC_ACK_WHISPER() {
	var result = 'PACKET_ZC_ACK_WHISPER {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x99
function PACKET_CZ_BROADCAST() {
	var result = 'PACKET_CZ_BROADCAST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a
function PACKET_ZC_BROADCAST() {
	var result = 'PACKET_ZC_BROADCAST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b
function PACKET_CZ_CHANGE_DIRECTION() {
	var result = 'PACKET_CZ_CHANGE_DIRECTION {\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    dir = ' + getDir() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9c
function PACKET_ZC_CHANGE_DIRECTION() {
	var result = 'PACKET_ZC_CHANGE_DIRECTION {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    dir = ' + getDir() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9d
function PACKET_ZC_ITEM_ENTRY() {
	var result = 'PACKET_ZC_ITEM_ENTRY {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    subX = ' + parser.fetchByte() + '\n';
	result += '    subY = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9e
function PACKET_ZC_ITEM_FALL_ENTRY() {
	var result = 'PACKET_ZC_ITEM_FALL_ENTRY {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    subX = ' + parser.fetchByte() + '\n';
	result += '    subY = ' + parser.fetchByte() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9f
function PACKET_CZ_ITEM_PICKUP() {
	var result = 'PACKET_CZ_ITEM_PICKUP {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xa0
function PACKET_ZC_ITEM_PICKUP_ACK() {
	var result = 'PACKET_ZC_ITEM_PICKUP_ACK {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFOEQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '    location = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xa1
function PACKET_ZC_ITEM_DISAPPEAR() {
	var result = 'PACKET_ZC_ITEM_DISAPPEAR {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xa2
function PACKET_CZ_ITEM_THROW() {
	var result = 'PACKET_CZ_ITEM_THROW {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xa3
function PACKET_ZC_NORMAL_ITEMLIST() {
	var result = 'PACKET_ZC_NORMAL_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemInfo = parser.remainingLength()/10;
		for (var i = 0; i < itemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO itemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xa4
function PACKET_ZC_EQUIPMENT_ITEMLIST() {
	var result = 'PACKET_ZC_EQUIPMENT_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemInfo = parser.remainingLength()/20;
		for (var i = 0; i < itemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO itemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xa5
function PACKET_ZC_STORE_NORMAL_ITEMLIST() {
	var result = 'PACKET_ZC_STORE_NORMAL_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemInfo = parser.remainingLength()/10;
		for (var i = 0; i < itemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO itemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xa6
function PACKET_ZC_STORE_EQUIPMENT_ITEMLIST() {
	var result = 'PACKET_ZC_STORE_EQUIPMENT_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemInfo = parser.remainingLength()/20;
		for (var i = 0; i < itemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO itemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xa7
function PACKET_CZ_USE_ITEM() {
	var result = 'PACKET_CZ_USE_ITEM {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xa8
function PACKET_ZC_USE_ITEM_ACK() {
	var result = 'PACKET_ZC_USE_ITEM_ACK {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xa9
function PACKET_CZ_REQ_WEAR_EQUIP() {
	var result = 'PACKET_CZ_REQ_WEAR_EQUIP {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xaa
function PACKET_ZC_REQ_WEAR_EQUIP_ACK() {
	var result = 'PACKET_ZC_REQ_WEAR_EQUIP_ACK {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchWord() + '\n';
	result += '    wItemSpriteNumber = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xab
function PACKET_CZ_REQ_TAKEOFF_EQUIP() {
	var result = 'PACKET_CZ_REQ_TAKEOFF_EQUIP {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xac
function PACKET_ZC_REQ_TAKEOFF_EQUIP_ACK() {
	var result = 'PACKET_ZC_REQ_TAKEOFF_EQUIP_ACK {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xaf
function PACKET_ZC_ITEM_THROW_ACK() {
	var result = 'PACKET_ZC_ITEM_THROW_ACK {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb0
function PACKET_ZC_PAR_CHANGE() {
	var result = 'PACKET_ZC_PAR_CHANGE {\n';
	result += '    varID = ' + getVarInfo() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb1
function PACKET_ZC_LONGPAR_CHANGE() {
	var result = 'PACKET_ZC_LONGPAR_CHANGE {\n';
	result += '    varID = ' + getVarInfo() + '\n';
	result += '    amount = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb2
function PACKET_CZ_RESTART() {
	var result = 'PACKET_CZ_RESTART {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb3
function PACKET_ZC_RESTART_ACK() {
	var result = 'PACKET_ZC_RESTART_ACK {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb4
function PACKET_ZC_SAY_DIALOG() {
	var result = 'PACKET_ZC_SAY_DIALOG {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb5
function PACKET_ZC_WAIT_DIALOG() {
	var result = 'PACKET_ZC_WAIT_DIALOG {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb6
function PACKET_ZC_CLOSE_DIALOG() {
	var result = 'PACKET_ZC_CLOSE_DIALOG {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb7
function PACKET_ZC_MENU_LIST() {
	var result = 'PACKET_ZC_MENU_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb8
function PACKET_CZ_CHOOSE_MENU() {
	var result = 'PACKET_CZ_CHOOSE_MENU {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    num = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xb9
function PACKET_CZ_REQ_NEXT_SCRIPT() {
	var result = 'PACKET_CZ_REQ_NEXT_SCRIPT {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xba
function PACKET_CZ_REQ_STATUS() {
	var result = 'PACKET_CZ_REQ_STATUS {\n';
	result += '}\n';
	return result;
}

//packet = 0xbb
function PACKET_CZ_STATUS_CHANGE() {
	var result = 'PACKET_CZ_STATUS_CHANGE {\n';
	result += '    statusID = ' + parser.fetchWord() + '\n';
	result += '    changeAmount = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xbc
function PACKET_ZC_STATUS_CHANGE_ACK() {
	var result = 'PACKET_ZC_STATUS_CHANGE_ACK {\n';
	result += '    statusID = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '    value = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xbd
function PACKET_ZC_STATUS() {
	var result = 'PACKET_ZC_STATUS {\n';
	result += '    point = ' + parser.fetchWord() + '\n';
	result += '    str = ' + parser.fetchByte() + '\n';
	result += '    standardStr = ' + parser.fetchByte() + '\n';
	result += '    agi = ' + parser.fetchByte() + '\n';
	result += '    standardAgi = ' + parser.fetchByte() + '\n';
	result += '    vit = ' + parser.fetchByte() + '\n';
	result += '    standardVit = ' + parser.fetchByte() + '\n';
	result += '    Int = ' + parser.fetchByte() + '\n';
	result += '    standardInt = ' + parser.fetchByte() + '\n';
	result += '    dex = ' + parser.fetchByte() + '\n';
	result += '    standardDex = ' + parser.fetchByte() + '\n';
	result += '    luk = ' + parser.fetchByte() + '\n';
	result += '    standardLuk = ' + parser.fetchByte() + '\n';
	result += '    attPower = ' + parser.fetchWord() + '\n';
	result += '    refiningPower = ' + parser.fetchWord() + '\n';
	result += '    max_mattPower = ' + parser.fetchWord() + '\n';
	result += '    min_mattPower = ' + parser.fetchWord() + '\n';
	result += '    itemdefPower = ' + parser.fetchWord() + '\n';
	result += '    plusdefPower = ' + parser.fetchWord() + '\n';
	result += '    mdefPower = ' + parser.fetchWord() + '\n';
	result += '    plusmdefPower = ' + parser.fetchWord() + '\n';
	result += '    hitSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    avoidSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    plusAvoidSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    criticalSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    ASPD = ' + parser.fetchWord() + '\n';
	result += '    plusASPD = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xbe
function PACKET_ZC_STATUS_CHANGE() {
	var result = 'PACKET_ZC_STATUS_CHANGE {\n';
	result += '    statusID = ' + parser.fetchWord() + '\n';
	result += '    value = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xbf
function PACKET_CZ_REQ_EMOTION() {
	var result = 'PACKET_CZ_REQ_EMOTION {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xc0
function PACKET_ZC_EMOTION() {
	var result = 'PACKET_ZC_EMOTION {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xc1
function PACKET_CZ_REQ_USER_COUNT() {
	var result = 'PACKET_CZ_REQ_USER_COUNT {\n';
	result += '}\n';
	return result;
}

//packet = 0xc2
function PACKET_ZC_USER_COUNT() {
	var result = 'PACKET_ZC_USER_COUNT {\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xc3
function PACKET_ZC_SPRITE_CHANGE() {
	var result = 'PACKET_ZC_SPRITE_CHANGE {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    value = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xc4
function PACKET_ZC_SELECT_DEALTYPE() {
	var result = 'PACKET_ZC_SELECT_DEALTYPE {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xc5
function PACKET_CZ_ACK_SELECT_DEALTYPE() {
	var result = 'PACKET_CZ_ACK_SELECT_DEALTYPE {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xc6
function PACKET_ZC_PC_PURCHASE_ITEMLIST() {
	var result = 'PACKET_ZC_PC_PURCHASE_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemList = parser.remainingLength()/11;
		for (var i = 0; i < itemList; i++) {
			result += '    PURCHASE_ITEM itemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        discountprice = ' + parser.fetchDWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xc7
function PACKET_ZC_PC_SELL_ITEMLIST() {
	var result = 'PACKET_ZC_PC_SELL_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemList = parser.remainingLength()/10;
		for (var i = 0; i < itemList; i++) {
			result += '    SELL_ITEM itemList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        overchargeprice = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xc8
function PACKET_CZ_PC_PURCHASE_ITEMLIST() {
	var result = 'PACKET_CZ_PC_PURCHASE_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemList = parser.remainingLength()/4;
		for (var i = 0; i < itemList; i++) {
			result += '    CZ_PURCHASE_ITEM itemList[' + i + '] {\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xc9
function PACKET_CZ_PC_SELL_ITEMLIST() {
	var result = 'PACKET_CZ_PC_SELL_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemList = parser.remainingLength()/4;
		for (var i = 0; i < itemList; i++) {
			result += '    CZ_SELL_ITEM itemList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xca
function PACKET_ZC_PC_PURCHASE_RESULT() {
	var result = 'PACKET_ZC_PC_PURCHASE_RESULT {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xcb
function PACKET_ZC_PC_SELL_RESULT() {
	var result = 'PACKET_ZC_PC_SELL_RESULT {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xcc
function PACKET_CZ_DISCONNECT_CHARACTER() {
	var result = 'PACKET_CZ_DISCONNECT_CHARACTER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xcd
function PACKET_ZC_ACK_DISCONNECT_CHARACTER() {
	var result = 'PACKET_ZC_ACK_DISCONNECT_CHARACTER {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xce
function PACKET_CZ_DISCONNECT_ALL_CHARACTER() {
	var result = 'PACKET_CZ_DISCONNECT_ALL_CHARACTER {\n';
	result += '}\n';
	return result;
}

//packet = 0xcf
function PACKET_CZ_SETTING_WHISPER_PC() {
	var result = 'PACKET_CZ_SETTING_WHISPER_PC {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd0
function PACKET_CZ_SETTING_WHISPER_STATE() {
	var result = 'PACKET_CZ_SETTING_WHISPER_STATE {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd1
function PACKET_ZC_SETTING_WHISPER_PC() {
	var result = 'PACKET_ZC_SETTING_WHISPER_PC {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd2
function PACKET_ZC_SETTING_WHISPER_STATE() {
	var result = 'PACKET_ZC_SETTING_WHISPER_STATE {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd3
function PACKET_CZ_REQ_WHISPER_LIST() {
	var result = 'PACKET_CZ_REQ_WHISPER_LIST {\n';
	result += '}\n';
	return result;
}

//packet = 0xd4
function PACKET_ZC_WHISPER_LIST() {
	var result = 'PACKET_ZC_WHISPER_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var wisperList = parser.remainingLength()/24;
		for (var i = 0; i < wisperList; i++) {
			result += '    WHISPER_ITEM wisperList[' + i + '] {\n';
			result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xd5
function PACKET_CZ_CREATE_CHATROOM() {
	var result = 'PACKET_CZ_CREATE_CHATROOM {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    size = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    passwd = ' + '"' + parser.fetchString(8) + '"' + '\n';
	result += '    title = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd6
function PACKET_ZC_ACK_CREATE_CHATROOM() {
	var result = 'PACKET_ZC_ACK_CREATE_CHATROOM {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd7
function PACKET_ZC_ROOM_NEWENTRY() {
	var result = 'PACKET_ZC_ROOM_NEWENTRY {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    roomID = ' + parser.fetchDWord() + '\n';
	result += '    maxcount = ' + parser.fetchWord() + '\n';
	result += '    curcount = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    title = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd8
function PACKET_ZC_DESTROY_ROOM() {
	var result = 'PACKET_ZC_DESTROY_ROOM {\n';
	result += '    roomID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xd9
function PACKET_CZ_REQ_ENTER_ROOM() {
	var result = 'PACKET_CZ_REQ_ENTER_ROOM {\n';
	result += '    roomID = ' + parser.fetchDWord() + '\n';
	result += '    passwd = ' + '"' + parser.fetchString(8) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xda
function PACKET_ZC_REFUSE_ENTER_ROOM() {
	var result = 'PACKET_ZC_REFUSE_ENTER_ROOM {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xdb
function PACKET_ZC_ENTER_ROOM() {
	var result = 'PACKET_ZC_ENTER_ROOM {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    roomID = ' + parser.fetchDWord() + '\n';
	{
		var memberList = parser.remainingLength()/28;
		for (var i = 0; i < memberList; i++) {
			result += '    ROOM_MEMBER memberList[' + i + '] {\n';
			result += '        role = ' + parser.fetchDWord() + '\n';
			result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xdc
function PACKET_ZC_MEMBER_NEWENTRY() {
	var result = 'PACKET_ZC_MEMBER_NEWENTRY {\n';
	result += '    curcount = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xdd
function PACKET_ZC_MEMBER_EXIT() {
	var result = 'PACKET_ZC_MEMBER_EXIT {\n';
	result += '    curcount = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xde
function PACKET_CZ_CHANGE_CHATROOM() {
	var result = 'PACKET_CZ_CHANGE_CHATROOM {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    size = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    passwd = ' + '"' + parser.fetchString(8) + '"' + '\n';
	result += '    title = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xdf
function PACKET_ZC_CHANGE_CHATROOM() {
	var result = 'PACKET_ZC_CHANGE_CHATROOM {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    roomID = ' + parser.fetchDWord() + '\n';
	result += '    maxcount = ' + parser.fetchWord() + '\n';
	result += '    curcount = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    title = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe0
function PACKET_CZ_REQ_ROLE_CHANGE() {
	var result = 'PACKET_CZ_REQ_ROLE_CHANGE {\n';
	result += '    role = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe1
function PACKET_ZC_ROLE_CHANGE() {
	var result = 'PACKET_ZC_ROLE_CHANGE {\n';
	result += '    role = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe2
function PACKET_CZ_REQ_EXPEL_MEMBER() {
	var result = 'PACKET_CZ_REQ_EXPEL_MEMBER {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe3
function PACKET_CZ_EXIT_ROOM() {
	var result = 'PACKET_CZ_EXIT_ROOM {\n';
	result += '}\n';
	return result;
}

//packet = 0xe4
function PACKET_CZ_REQ_EXCHANGE_ITEM() {
	var result = 'PACKET_CZ_REQ_EXCHANGE_ITEM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe5
function PACKET_ZC_REQ_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_REQ_EXCHANGE_ITEM {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe6
function PACKET_CZ_ACK_EXCHANGE_ITEM() {
	var result = 'PACKET_CZ_ACK_EXCHANGE_ITEM {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe7
function PACKET_ZC_ACK_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_ACK_EXCHANGE_ITEM {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe8
function PACKET_CZ_ADD_EXCHANGE_ITEM() {
	var result = 'PACKET_CZ_ADD_EXCHANGE_ITEM {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xe9
function PACKET_ZC_ADD_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_ADD_EXCHANGE_ITEM {\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0xea
function PACKET_ZC_ACK_ADD_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_ACK_ADD_EXCHANGE_ITEM {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xeb
function PACKET_CZ_CONCLUDE_EXCHANGE_ITEM() {
	var result = 'PACKET_CZ_CONCLUDE_EXCHANGE_ITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0xec
function PACKET_ZC_CONCLUDE_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_CONCLUDE_EXCHANGE_ITEM {\n';
	result += '    who = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xed
function PACKET_CZ_CANCEL_EXCHANGE_ITEM() {
	var result = 'PACKET_CZ_CANCEL_EXCHANGE_ITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0xee
function PACKET_ZC_CANCEL_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_CANCEL_EXCHANGE_ITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0xef
function PACKET_CZ_EXEC_EXCHANGE_ITEM() {
	var result = 'PACKET_CZ_EXEC_EXCHANGE_ITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0xf0
function PACKET_ZC_EXEC_EXCHANGE_ITEM() {
	var result = 'PACKET_ZC_EXEC_EXCHANGE_ITEM {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xf1
function PACKET_ZC_EXCHANGEITEM_UNDO() {
	var result = 'PACKET_ZC_EXCHANGEITEM_UNDO {\n';
	result += '}\n';
	return result;
}

//packet = 0xf2
function PACKET_ZC_NOTIFY_STOREITEM_COUNTINFO() {
	var result = 'PACKET_ZC_NOTIFY_STOREITEM_COUNTINFO {\n';
	result += '    curCount = ' + parser.fetchWord() + '\n';
	result += '    maxCount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xf3
function PACKET_CZ_MOVE_ITEM_FROM_BODY_TO_STORE() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_BODY_TO_STORE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xf4
function PACKET_ZC_ADD_ITEM_TO_STORE() {
	var result = 'PACKET_ZC_ADD_ITEM_TO_STORE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0xf5
function PACKET_CZ_MOVE_ITEM_FROM_STORE_TO_BODY() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_STORE_TO_BODY {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xf6
function PACKET_ZC_DELETE_ITEM_FROM_STORE() {
	var result = 'PACKET_ZC_DELETE_ITEM_FROM_STORE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xf7
function PACKET_CZ_CLOSE_STORE() {
	var result = 'PACKET_CZ_CLOSE_STORE {\n';
	result += '}\n';
	return result;
}

//packet = 0xf8
function PACKET_ZC_CLOSE_STORE() {
	var result = 'PACKET_ZC_CLOSE_STORE {\n';
	result += '}\n';
	return result;
}

//packet = 0xf9
function PACKET_CZ_MAKE_GROUP() {
	var result = 'PACKET_CZ_MAKE_GROUP {\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xfa
function PACKET_ZC_ACK_MAKE_GROUP() {
	var result = 'PACKET_ZC_ACK_MAKE_GROUP {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xfb
function PACKET_ZC_GROUP_LIST() {
	var result = 'PACKET_ZC_GROUP_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	{
		var groupInfo = parser.remainingLength()/46;
		for (var i = 0; i < groupInfo; i++) {
			result += '    GROUPMEMBER_INFO groupInfo[' + i + '] {\n';
			result += '        AID = ' + parser.fetchDWord() + '\n';
			result += '        characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
			result += '        role = ' + parser.fetchByte() + '\n';
			result += '        state = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0xfc
function PACKET_CZ_REQ_JOIN_GROUP() {
	var result = 'PACKET_CZ_REQ_JOIN_GROUP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xfd
function PACKET_ZC_ACK_REQ_JOIN_GROUP() {
	var result = 'PACKET_ZC_ACK_REQ_JOIN_GROUP {\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    answer = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0xfe
function PACKET_ZC_REQ_JOIN_GROUP() {
	var result = 'PACKET_ZC_REQ_JOIN_GROUP {\n';
	result += '    GRID = ' + parser.fetchDWord() + '\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0xff
function PACKET_CZ_JOIN_GROUP() {
	var result = 'PACKET_CZ_JOIN_GROUP {\n';
	result += '    GRID = ' + parser.fetchDWord() + '\n';
	result += '    answer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x100
function PACKET_CZ_REQ_LEAVE_GROUP() {
	var result = 'PACKET_CZ_REQ_LEAVE_GROUP {\n';
	result += '}\n';
	return result;
}

//packet = 0x101
function PACKET_ZC_GROUPINFO_CHANGE() {
	var result = 'PACKET_ZC_GROUPINFO_CHANGE {\n';
	result += '    expOption = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x102
function PACKET_CZ_CHANGE_GROUPEXPOPTION() {
	var result = 'PACKET_CZ_CHANGE_GROUPEXPOPTION {\n';
	result += '    expOption = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x103
function PACKET_CZ_REQ_EXPEL_GROUP_MEMBER() {
	var result = 'PACKET_CZ_REQ_EXPEL_GROUP_MEMBER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x104
function PACKET_ZC_ADD_MEMBER_TO_GROUP() {
	var result = 'PACKET_ZC_ADD_MEMBER_TO_GROUP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Role = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x105
function PACKET_ZC_DELETE_MEMBER_FROM_GROUP() {
	var result = 'PACKET_ZC_DELETE_MEMBER_FROM_GROUP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x106
function PACKET_ZC_NOTIFY_HP_TO_GROUPM() {
	var result = 'PACKET_ZC_NOTIFY_HP_TO_GROUPM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    hp = ' + parser.fetchWord() + '\n';
	result += '    maxhp = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x107
function PACKET_ZC_NOTIFY_POSITION_TO_GROUPM() {
	var result = 'PACKET_ZC_NOTIFY_POSITION_TO_GROUPM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x108
function PACKET_CZ_REQUEST_CHAT_PARTY() {
	var result = 'PACKET_CZ_REQUEST_CHAT_PARTY {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x109
function PACKET_ZC_NOTIFY_CHAT_PARTY() {
	var result = 'PACKET_ZC_NOTIFY_CHAT_PARTY {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x10a
function PACKET_ZC_MVP_GETTING_ITEM() {
	var result = 'PACKET_ZC_MVP_GETTING_ITEM {\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x10b
function PACKET_ZC_MVP_GETTING_SPECIAL_EXP() {
	var result = 'PACKET_ZC_MVP_GETTING_SPECIAL_EXP {\n';
	result += '    exp = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x10c
function PACKET_ZC_MVP() {
	var result = 'PACKET_ZC_MVP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x10d
function PACKET_ZC_THROW_MVPITEM() {
	var result = 'PACKET_ZC_THROW_MVPITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0x10e
function PACKET_ZC_SKILLINFO_UPDATE() {
	var result = 'PACKET_ZC_SKILLINFO_UPDATE {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    spcost = ' + parser.fetchWord() + '\n';
	result += '    attackRange = ' + parser.fetchWord() + '\n';
	result += '    upgradable = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x10f
function PACKET_ZC_SKILLINFO_LIST() {
	var result = 'PACKET_ZC_SKILLINFO_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var skillList = parser.remainingLength()/37;
		for (var i = 0; i < skillList; i++) {
			result += '    SKILLINFO skillList[' + i + '] {\n';
			result += '        SKID = ' + getSkillInfo() + '\n';
			result += '        type = ' + parser.fetchDWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        spcost = ' + parser.fetchWord() + '\n';
			result += '        attackRange = ' + parser.fetchWord() + '\n';
			result += '        skillName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        upgradable = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x110
function PACKET_ZC_ACK_TOUSESKILL() {
	var result = 'PACKET_ZC_ACK_TOUSESKILL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    NUM = ' + parser.fetchDWord() + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '    cause = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x111
function PACKET_ZC_ADD_SKILL() {
	var result = 'PACKET_ZC_ADD_SKILL {\n';
	{
		result += '    SKILLINFO data {\n';
		result += '        SKID = ' + getSkillInfo() + '\n';
		result += '        type = ' + parser.fetchDWord() + '\n';
		result += '        level = ' + parser.fetchWord() + '\n';
		result += '        spcost = ' + parser.fetchWord() + '\n';
		result += '        attackRange = ' + parser.fetchWord() + '\n';
		result += '        skillName = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '        upgradable = ' + parser.fetchBool() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x112
function PACKET_CZ_UPGRADE_SKILLLEVEL() {
	var result = 'PACKET_CZ_UPGRADE_SKILLLEVEL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x113
function PACKET_CZ_USE_SKILL() {
	var result = 'PACKET_CZ_USE_SKILL {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x114
function PACKET_ZC_NOTIFY_SKILL() {
	var result = 'PACKET_ZC_NOTIFY_SKILL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    attackMT = ' + parser.fetchDWord() + '\n';
	result += '    attackedMT = ' + parser.fetchDWord() + '\n';
	result += '    damage = ' + parser.fetchWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x115
function PACKET_ZC_NOTIFY_SKILL_POSITION() {
	var result = 'PACKET_ZC_NOTIFY_SKILL_POSITION {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    attackMT = ' + parser.fetchDWord() + '\n';
	result += '    attackedMT = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    damage = ' + parser.fetchWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x116
function PACKET_CZ_USE_SKILL_TOGROUND() {
	var result = 'PACKET_CZ_USE_SKILL_TOGROUND {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x117
function PACKET_ZC_NOTIFY_GROUNDSKILL() {
	var result = 'PACKET_ZC_NOTIFY_GROUNDSKILL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x118
function PACKET_CZ_CANCEL_LOCKON() {
	var result = 'PACKET_CZ_CANCEL_LOCKON {\n';
	result += '}\n';
	return result;
}

//packet = 0x119
function PACKET_ZC_STATE_CHANGE() {
	var result = 'PACKET_ZC_STATE_CHANGE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x11a
function PACKET_ZC_USE_SKILL() {
	var result = 'PACKET_ZC_USE_SKILL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    targetAID = ' + parser.fetchDWord() + '\n';
	result += '    srcAID = ' + parser.fetchDWord() + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x11b
function PACKET_CZ_SELECT_WARPPOINT() {
	var result = 'PACKET_CZ_SELECT_WARPPOINT {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x11c
function PACKET_ZC_WARPLIST() {
	var result = 'PACKET_ZC_WARPLIST {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x11d
function PACKET_CZ_REMEMBER_WARPPOINT() {
	var result = 'PACKET_CZ_REMEMBER_WARPPOINT {\n';
	result += '}\n';
	return result;
}

//packet = 0x11e
function PACKET_ZC_ACK_REMEMBER_WARPPOINT() {
	var result = 'PACKET_ZC_ACK_REMEMBER_WARPPOINT {\n';
	result += '    errorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x11f
function PACKET_ZC_SKILL_ENTRY() {
	var result = 'PACKET_ZC_SKILL_ENTRY {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    creatorAID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    job = ' + parser.fetchByte() + '\n';
	result += '    isVisible = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x120
function PACKET_ZC_SKILL_DISAPPEAR() {
	var result = 'PACKET_ZC_SKILL_DISAPPEAR {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x121
function PACKET_ZC_NOTIFY_CARTITEM_COUNTINFO() {
	var result = 'PACKET_ZC_NOTIFY_CARTITEM_COUNTINFO {\n';
	result += '    curCount = ' + parser.fetchWord() + '\n';
	result += '    maxCount = ' + parser.fetchWord() + '\n';
	result += '    curWeight = ' + parser.fetchDWord() + '\n';
	result += '    maxWeight = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x122
function PACKET_ZC_CART_EQUIPMENT_ITEMLIST() {
	var result = 'PACKET_ZC_CART_EQUIPMENT_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemInfo = parser.remainingLength()/20;
		for (var i = 0; i < itemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO itemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x123
function PACKET_ZC_CART_NORMAL_ITEMLIST() {
	var result = 'PACKET_ZC_CART_NORMAL_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemInfo = parser.remainingLength()/10;
		for (var i = 0; i < itemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO itemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x124
function PACKET_ZC_ADD_ITEM_TO_CART() {
	var result = 'PACKET_ZC_ADD_ITEM_TO_CART {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x125
function PACKET_ZC_DELETE_ITEM_FROM_CART() {
	var result = 'PACKET_ZC_DELETE_ITEM_FROM_CART {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x126
function PACKET_CZ_MOVE_ITEM_FROM_BODY_TO_CART() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_BODY_TO_CART {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x127
function PACKET_CZ_MOVE_ITEM_FROM_CART_TO_BODY() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_CART_TO_BODY {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x128
function PACKET_CZ_MOVE_ITEM_FROM_STORE_TO_CART() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_STORE_TO_CART {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x129
function PACKET_CZ_MOVE_ITEM_FROM_CART_TO_STORE() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_CART_TO_STORE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x12a
function PACKET_CZ_REQ_CARTOFF() {
	var result = 'PACKET_CZ_REQ_CARTOFF {\n';
	result += '}\n';
	return result;
}

//packet = 0x12b
function PACKET_ZC_CARTOFF() {
	var result = 'PACKET_ZC_CARTOFF {\n';
	result += '}\n';
	return result;
}

//packet = 0x12c
function PACKET_ZC_ACK_ADDITEM_TO_CART() {
	var result = 'PACKET_ZC_ACK_ADDITEM_TO_CART {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x12d
function PACKET_ZC_OPENSTORE() {
	var result = 'PACKET_ZC_OPENSTORE {\n';
	result += '    itemcount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x12e
function PACKET_CZ_REQ_CLOSESTORE() {
	var result = 'PACKET_CZ_REQ_CLOSESTORE {\n';
	result += '}\n';
	return result;
}

//packet = 0x12f
function PACKET_CZ_REQ_OPENSTORE() {
	var result = 'PACKET_CZ_REQ_OPENSTORE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    storeName = ' + '"' + parser.fetchString(80) + '"' + '\n';
	{
		var storeList = parser.remainingLength()/8;
		for (var i = 0; i < storeList; i++) {
			result += '    STORE_ITEM storeList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        Price = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x130
function PACKET_CZ_REQ_BUY_FROMMC() {
	var result = 'PACKET_CZ_REQ_BUY_FROMMC {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x131
function PACKET_ZC_STORE_ENTRY() {
	var result = 'PACKET_ZC_STORE_ENTRY {\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '    storeName = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x132
function PACKET_ZC_DISAPPEAR_ENTRY() {
	var result = 'PACKET_ZC_DISAPPEAR_ENTRY {\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x133
function PACKET_ZC_PC_PURCHASE_ITEMLIST_FROMMC() {
	var result = 'PACKET_ZC_PC_PURCHASE_ITEMLIST_FROMMC {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	{
		var itemList = parser.remainingLength()/22;
		for (var i = 0; i < itemList; i++) {
			result += '    PURCHASE_ITEM_FROMMC itemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        IsIdentified = ' + parser.fetchByte() + '\n';
			result += '        IsDamaged = ' + parser.fetchByte() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x134
function PACKET_CZ_PC_PURCHASE_ITEMLIST_FROMMC() {
	var result = 'PACKET_CZ_PC_PURCHASE_ITEMLIST_FROMMC {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	{
		var itemList = parser.remainingLength()/4;
		for (var i = 0; i < itemList; i++) {
			result += '    CZ_PURCHASE_ITEM_FROMMC itemList[' + i + '] {\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x135
function PACKET_ZC_PC_PURCHASE_RESULT_FROMMC() {
	var result = 'PACKET_ZC_PC_PURCHASE_RESULT_FROMMC {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    curcount = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x136
function PACKET_ZC_PC_PURCHASE_MYITEMLIST() {
	var result = 'PACKET_ZC_PC_PURCHASE_MYITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	{
		var itemList = parser.remainingLength()/22;
		for (var i = 0; i < itemList; i++) {
			result += '    PURCHASE_MYITEM itemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        IsIdentified = ' + parser.fetchByte() + '\n';
			result += '        IsDamaged = ' + parser.fetchByte() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x137
function PACKET_ZC_DELETEITEM_FROM_MCSTORE() {
	var result = 'PACKET_ZC_DELETEITEM_FROM_MCSTORE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x138
function PACKET_CZ_PKMODE_CHANGE() {
	var result = 'PACKET_CZ_PKMODE_CHANGE {\n';
	result += '    isTurnOn = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x139
function PACKET_ZC_ATTACK_FAILURE_FOR_DISTANCE() {
	var result = 'PACKET_ZC_ATTACK_FAILURE_FOR_DISTANCE {\n';
	result += '    targetAID = ' + parser.fetchDWord() + '\n';
	result += '    targetXPos = ' + parser.fetchWord() + '\n';
	result += '    targetYPos = ' + parser.fetchWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    currentAttRange = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x13a
function PACKET_ZC_ATTACK_RANGE() {
	var result = 'PACKET_ZC_ATTACK_RANGE {\n';
	result += '    currentAttRange = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x13b
function PACKET_ZC_ACTION_FAILURE() {
	var result = 'PACKET_ZC_ACTION_FAILURE {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x13c
function PACKET_ZC_EQUIP_ARROW() {
	var result = 'PACKET_ZC_EQUIP_ARROW {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x13d
function PACKET_ZC_RECOVERY() {
	var result = 'PACKET_ZC_RECOVERY {\n';
	result += '    varID = ' + getVarInfo() + '\n';
	result += '    amount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x13e
function PACKET_ZC_USESKILL_ACK() {
	var result = 'PACKET_ZC_USESKILL_ACK {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    property = ' + parser.fetchDWord() + '\n';
	result += '    delayTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x13f
function PACKET_CZ_ITEM_CREATE() {
	var result = 'PACKET_CZ_ITEM_CREATE {\n';
	result += '    itemName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x140
function PACKET_CZ_MOVETO_MAP() {
	var result = 'PACKET_CZ_MOVETO_MAP {\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x141
function PACKET_ZC_COUPLESTATUS() {
	var result = 'PACKET_ZC_COUPLESTATUS {\n';
	result += '    statusType = ' + parser.fetchDWord() + '\n';
	result += '    defaultStatus = ' + parser.fetchDWord() + '\n';
	result += '    plusStatus = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x142
function PACKET_ZC_OPEN_EDITDLG() {
	var result = 'PACKET_ZC_OPEN_EDITDLG {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x143
function PACKET_CZ_INPUT_EDITDLG() {
	var result = 'PACKET_CZ_INPUT_EDITDLG {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x144
function PACKET_ZC_COMPASS() {
	var result = 'PACKET_ZC_COMPASS {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchDWord() + '\n';
	result += '    yPos = ' + parser.fetchDWord() + '\n';
	result += '    id = ' + parser.fetchByte() + '\n';
	result += '    color = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x145
function PACKET_ZC_SHOW_IMAGE() {
	var result = 'PACKET_ZC_SHOW_IMAGE {\n';
	result += '    imageName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x146
function PACKET_CZ_CLOSE_DIALOG() {
	var result = 'PACKET_CZ_CLOSE_DIALOG {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x147
function PACKET_ZC_AUTORUN_SKILL() {
	var result = 'PACKET_ZC_AUTORUN_SKILL {\n';
	{
		result += '    SKILLINFO data {\n';
		result += '        SKID = ' + getSkillInfo() + '\n';
		result += '        type = ' + parser.fetchDWord() + '\n';
		result += '        level = ' + parser.fetchWord() + '\n';
		result += '        spcost = ' + parser.fetchWord() + '\n';
		result += '        attackRange = ' + parser.fetchWord() + '\n';
		result += '        skillName = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '        upgradable = ' + parser.fetchBool() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x148
function PACKET_ZC_RESURRECTION() {
	var result = 'PACKET_ZC_RESURRECTION {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x149
function PACKET_CZ_REQ_GIVE_MANNER_POINT() {
	var result = 'PACKET_CZ_REQ_GIVE_MANNER_POINT {\n';
	result += '    otherAID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    point = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x14a
function PACKET_ZC_ACK_GIVE_MANNER_POINT() {
	var result = 'PACKET_ZC_ACK_GIVE_MANNER_POINT {\n';
	result += '    result = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x14b
function PACKET_ZC_NOTIFY_MANNER_POINT_GIVEN() {
	var result = 'PACKET_ZC_NOTIFY_MANNER_POINT_GIVEN {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    otherCharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x14c
function PACKET_ZC_MYGUILD_BASIC_INFO() {
	var result = 'PACKET_ZC_MYGUILD_BASIC_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var relatedGuildList = parser.remainingLength()/32;
		for (var i = 0; i < relatedGuildList; i++) {
			result += '    RELATED_GUILD relatedGuildList[' + i + '] {\n';
			result += '        GDID = ' + parser.fetchDWord() + '\n';
			result += '        relation = ' + parser.fetchDWord() + '\n';
			result += '        GuildName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x14d
function PACKET_CZ_REQ_GUILD_MENUINTERFACE() {
	var result = 'PACKET_CZ_REQ_GUILD_MENUINTERFACE {\n';
	result += '}\n';
	return result;
}

//packet = 0x14e
function PACKET_ZC_ACK_GUILD_MENUINTERFACE() {
	var result = 'PACKET_ZC_ACK_GUILD_MENUINTERFACE {\n';
	result += '    guildMemuFlag = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x14f
function PACKET_CZ_REQ_GUILD_MENU() {
	var result = 'PACKET_CZ_REQ_GUILD_MENU {\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x150
function PACKET_ZC_GUILD_INFO() {
	var result = 'PACKET_ZC_GUILD_INFO {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchDWord() + '\n';
	result += '    userNum = ' + parser.fetchDWord() + '\n';
	result += '    maxUserNum = ' + parser.fetchDWord() + '\n';
	result += '    userAverageLevel = ' + parser.fetchDWord() + '\n';
	result += '    exp = ' + parser.fetchDWord() + '\n';
	result += '    maxExp = ' + parser.fetchDWord() + '\n';
	result += '    point = ' + parser.fetchDWord() + '\n';
	result += '    honor = ' + parser.fetchDWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    emblemVersion = ' + parser.fetchDWord() + '\n';
	result += '    guildname = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    masterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    manageLand = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x151
function PACKET_CZ_REQ_GUILD_EMBLEM_IMG() {
	var result = 'PACKET_CZ_REQ_GUILD_EMBLEM_IMG {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x152
function PACKET_ZC_GUILD_EMBLEM_IMG() {
	var result = 'PACKET_ZC_GUILD_EMBLEM_IMG {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    emblemVersion = ' + parser.fetchDWord() + '\n';
	result += '    img = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x153
function PACKET_CZ_REGISTER_GUILD_EMBLEM_IMG() {
	var result = 'PACKET_CZ_REGISTER_GUILD_EMBLEM_IMG {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    img = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x154
function PACKET_ZC_MEMBERMGR_INFO() {
	var result = 'PACKET_ZC_MEMBERMGR_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberInfo = parser.remainingLength()/104;
		for (var i = 0; i < memberInfo; i++) {
			result += '    GUILD_MEMBERMGR_INFO memberInfo[' + i + '] {\n';
			result += '        AID = ' + parser.fetchDWord() + '\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        HeadType = ' + parser.fetchWord() + '\n';
			result += '        HeadPalette = ' + parser.fetchWord() + '\n';
			result += '        Sex = ' + parser.fetchWord() + '\n';
			result += '        Job = ' + getJobInfo(2) + '\n';
			result += '        Level = ' + parser.fetchWord() + '\n';
			result += '        MemberExp = ' + parser.fetchDWord() + '\n';
			result += '        CurrentState = ' + parser.fetchDWord() + '\n';
			result += '        GPositionID = ' + parser.fetchDWord() + '\n';
			result += '        Memo = ' + '"' + parser.fetchString(50) + '"' + '\n';
			result += '        CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x155
function PACKET_CZ_REQ_CHANGE_MEMBERPOS() {
	var result = 'PACKET_CZ_REQ_CHANGE_MEMBERPOS {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberInfo = parser.remainingLength()/12;
		for (var i = 0; i < memberInfo; i++) {
			result += '    MEMBER_POSITION_INFO memberInfo[' + i + '] {\n';
			result += '        AID = ' + parser.fetchDWord() + '\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        positionID = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x156
function PACKET_ZC_ACK_REQ_CHANGE_MEMBERS() {
	var result = 'PACKET_ZC_ACK_REQ_CHANGE_MEMBERS {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberInfo = parser.remainingLength()/12;
		for (var i = 0; i < memberInfo; i++) {
			result += '    MEMBER_POSITION_INFO memberInfo[' + i + '] {\n';
			result += '        AID = ' + parser.fetchDWord() + '\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        positionID = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x157
function PACKET_CZ_REQ_OPEN_MEMBER_INFO() {
	var result = 'PACKET_CZ_REQ_OPEN_MEMBER_INFO {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x158
function PACKET_ZC_ACK_OPEN_MEMBER_INFO() {
	var result = 'PACKET_ZC_ACK_OPEN_MEMBER_INFO {\n';
	result += '}\n';
	return result;
}

//packet = 0x159
function PACKET_CZ_REQ_LEAVE_GUILD() {
	var result = 'PACKET_CZ_REQ_LEAVE_GUILD {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    reasonDesc = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x15a
function PACKET_ZC_ACK_LEAVE_GUILD() {
	var result = 'PACKET_ZC_ACK_LEAVE_GUILD {\n';
	result += '    charName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    reasonDesc = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x15b
function PACKET_CZ_REQ_BAN_GUILD() {
	var result = 'PACKET_CZ_REQ_BAN_GUILD {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    reasonDesc = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x15c
function PACKET_ZC_ACK_BAN_GUILD() {
	var result = 'PACKET_ZC_ACK_BAN_GUILD {\n';
	result += '    charName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    reasonDesc = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '    account = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x15d
function PACKET_CZ_REQ_DISORGANIZE_GUILD() {
	var result = 'PACKET_CZ_REQ_DISORGANIZE_GUILD {\n';
	result += '    key = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x15e
function PACKET_ZC_ACK_DISORGANIZE_GUILD_RESULT() {
	var result = 'PACKET_ZC_ACK_DISORGANIZE_GUILD_RESULT {\n';
	result += '    reason = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x15f
function PACKET_ZC_ACK_DISORGANIZE_GUILD() {
	var result = 'PACKET_ZC_ACK_DISORGANIZE_GUILD {\n';
	result += '    reasonDesc = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x160
function PACKET_ZC_POSITION_INFO() {
	var result = 'PACKET_ZC_POSITION_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberInfo = parser.remainingLength()/16;
		for (var i = 0; i < memberInfo; i++) {
			result += '    GUILD_MEMBER_POSITION_INFO memberInfo[' + i + '] {\n';
			result += '        positionID = ' + parser.fetchDWord() + '\n';
			result += '        right = ' + parser.fetchDWord() + '\n';
			result += '        ranking = ' + parser.fetchDWord() + '\n';
			result += '        payRate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x161
function PACKET_CZ_REG_CHANGE_GUILD_POSITIONINFO() {
	var result = 'PACKET_CZ_REG_CHANGE_GUILD_POSITIONINFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberList = parser.remainingLength()/40;
		for (var i = 0; i < memberList; i++) {
			result += '    GUILD_REG_POSITION_INFO memberList[' + i + '] {\n';
			result += '        positionID = ' + parser.fetchDWord() + '\n';
			result += '        right = ' + parser.fetchDWord() + '\n';
			result += '        ranking = ' + parser.fetchDWord() + '\n';
			result += '        payRate = ' + parser.fetchDWord() + '\n';
			result += '        posName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x162
function PACKET_ZC_GUILD_SKILLINFO() {
	var result = 'PACKET_ZC_GUILD_SKILLINFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    skillPoint = ' + parser.fetchWord() + '\n';
	{
		var skillList = parser.remainingLength()/37;
		for (var i = 0; i < skillList; i++) {
			result += '    SKILLINFO skillList[' + i + '] {\n';
			result += '        SKID = ' + getSkillInfo() + '\n';
			result += '        type = ' + parser.fetchDWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        spcost = ' + parser.fetchWord() + '\n';
			result += '        attackRange = ' + parser.fetchWord() + '\n';
			result += '        skillName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        upgradable = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x163
function PACKET_ZC_BAN_LIST() {
	var result = 'PACKET_ZC_BAN_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var banList = parser.remainingLength()/88;
		for (var i = 0; i < banList; i++) {
			result += '    GUILD_BAN_INFO banList[' + i + '] {\n';
			result += '        charname = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        account = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        reason = ' + '"' + parser.fetchString(40) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x164
function PACKET_ZC_OTHER_GUILD_LIST() {
	var result = 'PACKET_ZC_OTHER_GUILD_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var guildList = parser.remainingLength()/36;
		for (var i = 0; i < guildList; i++) {
			result += '    OTHER_GUILD_INFO guildList[' + i + '] {\n';
			result += '        guildname = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        guildLevel = ' + parser.fetchDWord() + '\n';
			result += '        guildMemberSize = ' + parser.fetchDWord() + '\n';
			result += '        guildRanking = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x165
function PACKET_CZ_REQ_MAKE_GUILD() {
	var result = 'PACKET_CZ_REQ_MAKE_GUILD {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    GName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x166
function PACKET_ZC_POSITION_ID_NAME_INFO() {
	var result = 'PACKET_ZC_POSITION_ID_NAME_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberList = parser.remainingLength()/28;
		for (var i = 0; i < memberList; i++) {
			result += '    MEMBER_POSITION_ID_NAME_INFO memberList[' + i + '] {\n';
			result += '        positionID = ' + parser.fetchDWord() + '\n';
			result += '        posName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x167
function PACKET_ZC_RESULT_MAKE_GUILD() {
	var result = 'PACKET_ZC_RESULT_MAKE_GUILD {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x168
function PACKET_CZ_REQ_JOIN_GUILD() {
	var result = 'PACKET_CZ_REQ_JOIN_GUILD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    MyAID = ' + parser.fetchDWord() + '\n';
	result += '    MyGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x169
function PACKET_ZC_ACK_REQ_JOIN_GUILD() {
	var result = 'PACKET_ZC_ACK_REQ_JOIN_GUILD {\n';
	result += '    answer = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x16a
function PACKET_ZC_REQ_JOIN_GUILD() {
	var result = 'PACKET_ZC_REQ_JOIN_GUILD {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    guildName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x16b
function PACKET_CZ_JOIN_GUILD() {
	var result = 'PACKET_CZ_JOIN_GUILD {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    answer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x16c
function PACKET_ZC_UPDATE_GDID() {
	var result = 'PACKET_ZC_UPDATE_GDID {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    emblemVersion = ' + parser.fetchDWord() + '\n';
	result += '    right = ' + parser.fetchDWord() + '\n';
	result += '    isMaster = ' + parser.fetchBool() + '\n';
	result += '    InterSID = ' + parser.fetchDWord() + '\n';
	result += '    GName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x16d
function PACKET_ZC_UPDATE_CHARSTAT() {
	var result = 'PACKET_ZC_UPDATE_CHARSTAT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    status = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x16e
function PACKET_CZ_GUILD_NOTICE() {
	var result = 'PACKET_CZ_GUILD_NOTICE {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    subject = ' + '"' + parser.fetchString(60) + '"' + '\n';
	result += '    notice = ' + '"' + parser.fetchString(120) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x16f
function PACKET_ZC_GUILD_NOTICE() {
	var result = 'PACKET_ZC_GUILD_NOTICE {\n';
	result += '    subject = ' + '"' + parser.fetchString(60) + '"' + '\n';
	result += '    notice = ' + '"' + parser.fetchString(120) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x170
function PACKET_CZ_REQ_ALLY_GUILD() {
	var result = 'PACKET_CZ_REQ_ALLY_GUILD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    MyAID = ' + parser.fetchDWord() + '\n';
	result += '    MyGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x171
function PACKET_ZC_REQ_ALLY_GUILD() {
	var result = 'PACKET_ZC_REQ_ALLY_GUILD {\n';
	result += '    otherAID = ' + parser.fetchDWord() + '\n';
	result += '    guildName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x172
function PACKET_CZ_ALLY_GUILD() {
	var result = 'PACKET_CZ_ALLY_GUILD {\n';
	result += '    otherAID = ' + parser.fetchDWord() + '\n';
	result += '    answer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x173
function PACKET_ZC_ACK_REQ_ALLY_GUILD() {
	var result = 'PACKET_ZC_ACK_REQ_ALLY_GUILD {\n';
	result += '    answer = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x174
function PACKET_ZC_ACK_CHANGE_GUILD_POSITIONINFO() {
	var result = 'PACKET_ZC_ACK_CHANGE_GUILD_POSITIONINFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var memberList = parser.remainingLength()/30;
		for (var i = 0; i < memberList; i++) {
			result += '    GUILD_REG_POSITION_INFO memberList[' + i + '] {\n';
			result += '        positionID = ' + parser.fetchDWord() + '\n';
			result += '        right = ' + parser.fetchDWord() + '\n';
			result += '        ranking = ' + parser.fetchDWord() + '\n';
			result += '        payRate = ' + parser.fetchDWord() + '\n';
			result += '        posName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x175
function PACKET_CZ_REQ_GUILD_MEMBER_INFO() {
	var result = 'PACKET_CZ_REQ_GUILD_MEMBER_INFO {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x176
function PACKET_ZC_ACK_GUILD_MEMBER_INFO() {
	var result = 'PACKET_ZC_ACK_GUILD_MEMBER_INFO {\n';
	{
		result += '    GUILD_MEMBER_INFO Info {\n';
		result += '        AID = ' + parser.fetchDWord() + '\n';
		result += '        GID = ' + parser.fetchDWord() + '\n';
		result += '        head = ' + parser.fetchWord() + '\n';
		result += '        headPalette = ' + parser.fetchWord() + '\n';
		result += '        sex = ' + parser.fetchWord() + '\n';
		result += '        job = ' + getJobInfo(2) + '\n';
		result += '        level = ' + parser.fetchWord() + '\n';
		result += '        contributionExp = ' + parser.fetchDWord() + '\n';
		result += '        currentState = ' + parser.fetchDWord() + '\n';
		result += '        positionID = ' + parser.fetchDWord() + '\n';
		result += '        intro = ' + '"' + parser.fetchString(50) + '"' + '\n';
		result += '        charname = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x177
function PACKET_ZC_ITEMIDENTIFY_LIST() {
	var result = 'PACKET_ZC_ITEMIDENTIFY_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    ITIDList = ' + getWordList(-1) + '\n';
	result += '}\n';
	return result;
}

//packet = 0x178
function PACKET_CZ_REQ_ITEMIDENTIFY() {
	var result = 'PACKET_CZ_REQ_ITEMIDENTIFY {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x179
function PACKET_ZC_ACK_ITEMIDENTIFY() {
	var result = 'PACKET_ZC_ACK_ITEMIDENTIFY {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x17a
function PACKET_CZ_REQ_ITEMCOMPOSITION_LIST() {
	var result = 'PACKET_CZ_REQ_ITEMCOMPOSITION_LIST {\n';
	result += '    cardIndex = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x17b
function PACKET_ZC_ITEMCOMPOSITION_LIST() {
	var result = 'PACKET_ZC_ITEMCOMPOSITION_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    ITIDList = ' + getWordList(-1) + '\n';
	result += '}\n';
	return result;
}

//packet = 0x17c
function PACKET_CZ_REQ_ITEMCOMPOSITION() {
	var result = 'PACKET_CZ_REQ_ITEMCOMPOSITION {\n';
	result += '    cardIndex = ' + getItemInfo() + '\n';
	result += '    equipIndex = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x17d
function PACKET_ZC_ACK_ITEMCOMPOSITION() {
	var result = 'PACKET_ZC_ACK_ITEMCOMPOSITION {\n';
	result += '    equipIndex = ' + parser.fetchWord() + '\n';
	result += '    cardIndex = ' + getItemInfo() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x17e
function PACKET_CZ_GUILD_CHAT() {
	var result = 'PACKET_CZ_GUILD_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x17f
function PACKET_ZC_GUILD_CHAT() {
	var result = 'PACKET_ZC_GUILD_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x180
function PACKET_CZ_REQ_HOSTILE_GUILD() {
	var result = 'PACKET_CZ_REQ_HOSTILE_GUILD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x181
function PACKET_ZC_ACK_REQ_HOSTILE_GUILD() {
	var result = 'PACKET_ZC_ACK_REQ_HOSTILE_GUILD {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x182
function PACKET_ZC_MEMBER_ADD() {
	var result = 'PACKET_ZC_MEMBER_ADD {\n';
	{
		result += '    GUILD_MEMBER_INFO Info {\n';
		result += '        AID = ' + parser.fetchDWord() + '\n';
		result += '        GID = ' + parser.fetchDWord() + '\n';
		result += '        head = ' + parser.fetchWord() + '\n';
		result += '        headPalette = ' + parser.fetchWord() + '\n';
		result += '        sex = ' + parser.fetchWord() + '\n';
		result += '        job = ' + getJobInfo(2) + '\n';
		result += '        level = ' + parser.fetchWord() + '\n';
		result += '        contributionExp = ' + parser.fetchDWord() + '\n';
		result += '        currentState = ' + parser.fetchDWord() + '\n';
		result += '        positionID = ' + parser.fetchDWord() + '\n';
		result += '        intro = ' + '"' + parser.fetchString(50) + '"' + '\n';
		result += '        charname = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x183
function PACKET_CZ_REQ_DELETE_RELATED_GUILD() {
	var result = 'PACKET_CZ_REQ_DELETE_RELATED_GUILD {\n';
	result += '    OpponentGDID = ' + parser.fetchDWord() + '\n';
	result += '    Relation = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x184
function PACKET_ZC_DELETE_RELATED_GUILD() {
	var result = 'PACKET_ZC_DELETE_RELATED_GUILD {\n';
	result += '    OpponentGDID = ' + parser.fetchDWord() + '\n';
	result += '    Relation = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x185
function PACKET_ZC_ADD_RELATED_GUILD() {
	var result = 'PACKET_ZC_ADD_RELATED_GUILD {\n';
	{
		result += '    RELATED_GUILD_INFO Info {\n';
		result += '        relation = ' + parser.fetchDWord() + '\n';
		result += '        GDID = ' + parser.fetchDWord() + '\n';
		result += '        guildname = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x186
function PACKET_COLLECTORDEAD() {
	var result = 'PACKET_COLLECTORDEAD {\n';
	result += '    ServerID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x187
function PACKET_PING() {
	var result = 'PACKET_PING {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x188
function PACKET_ZC_ACK_ITEMREFINING() {
	var result = 'PACKET_ZC_ACK_ITEMREFINING {\n';
	result += '    result = ' + parser.fetchWord() + '\n';
	result += '    itemIndex = ' + parser.fetchWord() + '\n';
	result += '    refiningLevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x189
function PACKET_ZC_NOTIFY_MAPINFO() {
	var result = 'PACKET_ZC_NOTIFY_MAPINFO {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x18a
function PACKET_CZ_REQ_DISCONNECT() {
	var result = 'PACKET_CZ_REQ_DISCONNECT {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x18b
function PACKET_ZC_ACK_REQ_DISCONNECT() {
	var result = 'PACKET_ZC_ACK_REQ_DISCONNECT {\n';
	result += '    result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x18c
function PACKET_ZC_MONSTER_INFO() {
	var result = 'PACKET_ZC_MONSTER_INFO {\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    size = ' + parser.fetchWord() + '\n';
	result += '    hp = ' + parser.fetchDWord() + '\n';
	result += '    def = ' + parser.fetchWord() + '\n';
	result += '    raceType = ' + parser.fetchWord() + '\n';
	result += '    mdefPower = ' + parser.fetchWord() + '\n';
	result += '    property = ' + parser.fetchWord() + '\n';
	{
		result += '    PACKET_ZC_MONSTER_INFO propertyTable {\n';
		result += '        water = ' + parser.fetchByte() + '\n';
		result += '        earth = ' + parser.fetchByte() + '\n';
		result += '        fire = ' + parser.fetchByte() + '\n';
		result += '        wind = ' + parser.fetchByte() + '\n';
		result += '        poison = ' + parser.fetchByte() + '\n';
		result += '        saint = ' + parser.fetchByte() + '\n';
		result += '        dark = ' + parser.fetchByte() + '\n';
		result += '        mental = ' + parser.fetchByte() + '\n';
		result += '        undead = ' + parser.fetchByte() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x18d
function PACKET_ZC_MAKABLEITEMLIST() {
	var result = 'PACKET_ZC_MAKABLEITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		result += '    MAKABLEITEM_INFO info {\n';
		result += '        ITID = ' + getItemInfo() + '\n';
		result += '        material_ID = ' + getWordList(3) + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x18e
function PACKET_CZ_REQMAKINGITEM() {
	var result = 'PACKET_CZ_REQMAKINGITEM {\n';
	{
		result += '    MAKABLEITEM_INFO info {\n';
		result += '        ITID = ' + getItemInfo() + '\n';
		result += '        material_ID = ' + getWordList(3) + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x18f
function PACKET_ZC_ACK_REQMAKINGITEM() {
	var result = 'PACKET_ZC_ACK_REQMAKINGITEM {\n';
	result += '    result = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x190
function PACKET_CZ_USE_SKILL_TOGROUND_WITHTALKBOX() {
	var result = 'PACKET_CZ_USE_SKILL_TOGROUND_WITHTALKBOX {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    contents = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x191
function PACKET_ZC_TALKBOX_CHATCONTENTS() {
	var result = 'PACKET_ZC_TALKBOX_CHATCONTENTS {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    contents = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x192
function PACKET_ZC_UPDATE_MAPINFO() {
	var result = 'PACKET_ZC_UPDATE_MAPINFO {\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x193
function PACKET_CZ_REQNAME_BYGID() {
	var result = 'PACKET_CZ_REQNAME_BYGID {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x194
function PACKET_ZC_ACK_REQNAME_BYGID() {
	var result = 'PACKET_ZC_ACK_REQNAME_BYGID {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    CName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x195
function PACKET_ZC_ACK_REQNAMEALL() {
	var result = 'PACKET_ZC_ACK_REQNAMEALL {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    CName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    PName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    GName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    RName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x196
function PACKET_ZC_MSG_STATE_CHANGE() {
	var result = 'PACKET_ZC_MSG_STATE_CHANGE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    state = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x197
function PACKET_CZ_RESET() {
	var result = 'PACKET_CZ_RESET {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x198
function PACKET_CZ_CHANGE_MAPTYPE() {
	var result = 'PACKET_CZ_CHANGE_MAPTYPE {\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x199
function PACKET_ZC_NOTIFY_MAPPROPERTY() {
	var result = 'PACKET_ZC_NOTIFY_MAPPROPERTY {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x19a
function PACKET_ZC_NOTIFY_RANKING() {
	var result = 'PACKET_ZC_NOTIFY_RANKING {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    ranking = ' + parser.fetchDWord() + '\n';
	result += '    total = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x19b
function PACKET_ZC_NOTIFY_EFFECT() {
	var result = 'PACKET_ZC_NOTIFY_EFFECT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    effectID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x19d
function PACKET_CZ_CHANGE_EFFECTSTATE() {
	var result = 'PACKET_CZ_CHANGE_EFFECTSTATE {\n';
	result += '    EffectState = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x19e
function PACKET_ZC_START_CAPTURE() {
	var result = 'PACKET_ZC_START_CAPTURE {\n';
	result += '}\n';
	return result;
}

//packet = 0x19f
function PACKET_CZ_TRYCAPTURE_MONSTER() {
	var result = 'PACKET_CZ_TRYCAPTURE_MONSTER {\n';
	result += '    targetAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a0
function PACKET_ZC_TRYCAPTURE_MONSTER() {
	var result = 'PACKET_ZC_TRYCAPTURE_MONSTER {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a1
function PACKET_CZ_COMMAND_PET() {
	var result = 'PACKET_CZ_COMMAND_PET {\n';
	result += '    cSub = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a2
function PACKET_ZC_PROPERTY_PET() {
	var result = 'PACKET_ZC_PROPERTY_PET {\n';
	result += '    szName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    bModified = ' + parser.fetchByte() + '\n';
	result += '    nLevel = ' + parser.fetchWord() + '\n';
	result += '    nFullness = ' + parser.fetchWord() + '\n';
	result += '    nRelationship = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a3
function PACKET_ZC_FEED_PET() {
	var result = 'PACKET_ZC_FEED_PET {\n';
	result += '    cRet = ' + parser.fetchByte() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a4
function PACKET_ZC_CHANGESTATE_PET() {
	var result = 'PACKET_ZC_CHANGESTATE_PET {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    data = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a5
function PACKET_CZ_RENAME_PET() {
	var result = 'PACKET_CZ_RENAME_PET {\n';
	result += '    szName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a6
function PACKET_ZC_PETEGG_LIST() {
	var result = 'PACKET_ZC_PETEGG_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var eggList = parser.remainingLength()/2;
		for (var i = 0; i < eggList; i++) {
			result += '    PETEGGITEM_INFO eggList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1a7
function PACKET_CZ_SELECT_PETEGG() {
	var result = 'PACKET_CZ_SELECT_PETEGG {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a8
function PACKET_CZ_PETEGG_INFO() {
	var result = 'PACKET_CZ_PETEGG_INFO {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1a9
function PACKET_CZ_PET_ACT() {
	var result = 'PACKET_CZ_PET_ACT {\n';
	result += '    data = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1aa
function PACKET_ZC_PET_ACT() {
	var result = 'PACKET_ZC_PET_ACT {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    data = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ab
function PACKET_ZC_PAR_CHANGE_USER() {
	var result = 'PACKET_ZC_PAR_CHANGE_USER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    varID = ' + getVarInfo() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ac
function PACKET_ZC_SKILL_UPDATE() {
	var result = 'PACKET_ZC_SKILL_UPDATE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ad
function PACKET_ZC_MAKINGARROW_LIST() {
	var result = 'PACKET_ZC_MAKINGARROW_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var arrowList = parser.remainingLength()/2;
		for (var i = 0; i < arrowList; i++) {
			result += '    ARROWITEM_INFO arrowList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1ae
function PACKET_CZ_REQ_MAKINGARROW() {
	var result = 'PACKET_CZ_REQ_MAKINGARROW {\n';
	result += '    id = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1af
function PACKET_CZ_REQ_CHANGECART() {
	var result = 'PACKET_CZ_REQ_CHANGECART {\n';
	result += '    num = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b0
function PACKET_ZC_NPCSPRITE_CHANGE() {
	var result = 'PACKET_ZC_NPCSPRITE_CHANGE {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b1
function PACKET_ZC_SHOWDIGIT() {
	var result = 'PACKET_ZC_SHOWDIGIT {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b2
function PACKET_CZ_REQ_OPENSTORE2() {
	var result = 'PACKET_CZ_REQ_OPENSTORE2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    storeName = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	{
		var storeList = parser.remainingLength()/8;
		for (var i = 0; i < storeList; i++) {
			result += '    STORE_ITEM storeList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        Price = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1b3
function PACKET_ZC_SHOW_IMAGE2() {
	var result = 'PACKET_ZC_SHOW_IMAGE2 {\n';
	result += '    imageName = ' + '"' + parser.fetchString(64) + '"' + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b4
function PACKET_ZC_CHANGE_GUILD() {
	var result = 'PACKET_ZC_CHANGE_GUILD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    emblemVersion = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b5
function PACKET_SC_BILLING_INFO() {
	var result = 'PACKET_SC_BILLING_INFO {\n';
	result += '    dwAmountRemain = ' + parser.fetchDWord() + '\n';
	result += '    dwQuantityRemain = ' + parser.fetchDWord() + '\n';
	result += '    dwReserved1 = ' + parser.fetchDWord() + '\n';
	result += '    dwReserved2 = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b6
function PACKET_ZC_GUILD_INFO2() {
	var result = 'PACKET_ZC_GUILD_INFO2 {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchDWord() + '\n';
	result += '    userNum = ' + parser.fetchDWord() + '\n';
	result += '    maxUserNum = ' + parser.fetchDWord() + '\n';
	result += '    userAverageLevel = ' + parser.fetchDWord() + '\n';
	result += '    exp = ' + parser.fetchDWord() + '\n';
	result += '    maxExp = ' + parser.fetchDWord() + '\n';
	result += '    point = ' + parser.fetchDWord() + '\n';
	result += '    honor = ' + parser.fetchDWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    emblemVersion = ' + parser.fetchDWord() + '\n';
	result += '    guildname = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    masterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    manageLand = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    zeny = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b7
function PACKET_CZ_GUILD_ZENY() {
	var result = 'PACKET_CZ_GUILD_ZENY {\n';
	result += '    zeny = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b8
function PACKET_ZC_GUILD_ZENY_ACK() {
	var result = 'PACKET_ZC_GUILD_ZENY_ACK {\n';
	result += '    ret = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1b9
function PACKET_ZC_DISPEL() {
	var result = 'PACKET_ZC_DISPEL {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ba
function PACKET_CZ_REMOVE_AID() {
	var result = 'PACKET_CZ_REMOVE_AID {\n';
	result += '    AccountName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1bb
function PACKET_CZ_SHIFT() {
	var result = 'PACKET_CZ_SHIFT {\n';
	result += '    CharacterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1bc
function PACKET_CZ_RECALL() {
	var result = 'PACKET_CZ_RECALL {\n';
	result += '    AccountName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1bd
function PACKET_CZ_RECALL_GID() {
	var result = 'PACKET_CZ_RECALL_GID {\n';
	result += '    CharacterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1be
function PACKET_AC_ASK_PNGAMEROOM() {
	var result = 'PACKET_AC_ASK_PNGAMEROOM {\n';
	result += '}\n';
	return result;
}

//packet = 0x1bf
function PACKET_CA_REPLY_PNGAMEROOM() {
	var result = 'PACKET_CA_REPLY_PNGAMEROOM {\n';
	result += '    Permission = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1c0
function PACKET_CZ_REQ_REMAINTIME() {
	var result = 'PACKET_CZ_REQ_REMAINTIME {\n';
	result += '}\n';
	return result;
}

//packet = 0x1c1
function PACKET_ZC_REPLY_REMAINTIME() {
	var result = 'PACKET_ZC_REPLY_REMAINTIME {\n';
	result += '    Result = ' + parser.fetchDWord() + '\n';
	result += '    ExpirationDate = ' + parser.fetchDWord() + '\n';
	result += '    RemainTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1c2
function PACKET_ZC_INFO_REMAINTIME() {
	var result = 'PACKET_ZC_INFO_REMAINTIME {\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '    RemainTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1c3
function PACKET_ZC_BROADCAST2() {
	var result = 'PACKET_ZC_BROADCAST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    fontColor = ' + parser.fetchDWord() + '\n';
	result += '    fontType = ' + parser.fetchWord() + '\n';
	result += '    fontSize = ' + parser.fetchWord() + '\n';
	result += '    fontAlign = ' + parser.fetchWord() + '\n';
	result += '    fontY = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1c4
function PACKET_ZC_ADD_ITEM_TO_STORE2() {
	var result = 'PACKET_ZC_ADD_ITEM_TO_STORE2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x1c5
function PACKET_ZC_ADD_ITEM_TO_CART2() {
	var result = 'PACKET_ZC_ADD_ITEM_TO_CART2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x1c6
function PACKET_CS_REQ_ENCRYPTION() {
	var result = 'PACKET_CS_REQ_ENCRYPTION {\n';
	result += '    encCount = ' + parser.fetchByte() + '\n';
	result += '    decCount = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1c7
function PACKET_SC_ACK_ENCRYPTION() {
	var result = 'PACKET_SC_ACK_ENCRYPTION {\n';
	result += '}\n';
	return result;
}

//packet = 0x1c8
function PACKET_ZC_USE_ITEM_ACK2() {
	var result = 'PACKET_ZC_USE_ITEM_ACK2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    id = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1c9
function PACKET_ZC_SKILL_ENTRY2() {
	var result = 'PACKET_ZC_SKILL_ENTRY2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    creatorAID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    job = ' + parser.fetchByte() + '\n';
	result += '    isVisible = ' + parser.fetchBool() + '\n';
	result += '    isContens = ' + parser.fetchBool() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ca
function PACKET_CZ_REQMAKINGHOMUN() {
	var result = 'PACKET_CZ_REQMAKINGHOMUN {\n';
	result += '    result = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1cb
function PACKET_CZ_MONSTER_TALK() {
	var result = 'PACKET_CZ_MONSTER_TALK {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    stateId = ' + parser.fetchByte() + '\n';
	result += '    skillId = ' + parser.fetchByte() + '\n';
	result += '    arg1 = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1cc
function PACKET_ZC_MONSTER_TALK() {
	var result = 'PACKET_ZC_MONSTER_TALK {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    stateId = ' + parser.fetchByte() + '\n';
	result += '    skillId = ' + parser.fetchByte() + '\n';
	result += '    arg1 = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1cd
function PACKET_ZC_AUTOSPELLLIST() {
	var result = 'PACKET_ZC_AUTOSPELLLIST {\n';
	result += '    SKID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ce
function PACKET_CZ_SELECTAUTOSPELL() {
	var result = 'PACKET_CZ_SELECTAUTOSPELL {\n';
	result += '    SKID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1cf
function PACKET_ZC_DEVOTIONLIST() {
	var result = 'PACKET_ZC_DEVOTIONLIST {\n';
	result += '    myAID = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    range = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d0
function PACKET_ZC_SPIRITS() {
	var result = 'PACKET_ZC_SPIRITS {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    num = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d1
function PACKET_ZC_BLADESTOP() {
	var result = 'PACKET_ZC_BLADESTOP {\n';
	result += '    srcAID = ' + parser.fetchDWord() + '\n';
	result += '    destAID = ' + parser.fetchDWord() + '\n';
	result += '    flag = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d2
function PACKET_ZC_COMBODELAY() {
	var result = 'PACKET_ZC_COMBODELAY {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    delayTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d3
function PACKET_ZC_SOUND() {
	var result = 'PACKET_ZC_SOUND {\n';
	result += '    fileName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    act = ' + parser.fetchByte() + '\n';
	result += '    term = ' + parser.fetchDWord() + '\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d4
function PACKET_ZC_OPEN_EDITDLGSTR() {
	var result = 'PACKET_ZC_OPEN_EDITDLGSTR {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d5
function PACKET_CZ_INPUT_EDITDLGSTR() {
	var result = 'PACKET_CZ_INPUT_EDITDLGSTR {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d6
function PACKET_ZC_NOTIFY_MAPPROPERTY2() {
	var result = 'PACKET_ZC_NOTIFY_MAPPROPERTY2 {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d7
function PACKET_ZC_SPRITE_CHANGE2() {
	var result = 'PACKET_ZC_SPRITE_CHANGE2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d8
function PACKET_ZC_NOTIFY_STANDENTRY2() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1d9
function PACKET_ZC_NOTIFY_NEWENTRY2() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1da
function PACKET_ZC_NOTIFY_MOVEENTRY2() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1db
function PACKET_CA_REQ_HASH() {
	var result = 'PACKET_CA_REQ_HASH {\n';
	result += '}\n';
	return result;
}

//packet = 0x1dc
function PACKET_AC_ACK_HASH() {
	var result = 'PACKET_AC_ACK_HASH {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    secret = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1dd
function PACKET_CA_LOGIN2() {
	var result = 'PACKET_CA_LOGIN2 {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    PasswdMD5 = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1de
function PACKET_ZC_NOTIFY_SKILL2() {
	var result = 'PACKET_ZC_NOTIFY_SKILL2 {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    attackMT = ' + parser.fetchDWord() + '\n';
	result += '    attackedMT = ' + parser.fetchDWord() + '\n';
	result += '    damage = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1df
function PACKET_CZ_REQ_ACCOUNTNAME() {
	var result = 'PACKET_CZ_REQ_ACCOUNTNAME {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e0
function PACKET_ZC_ACK_ACCOUNTNAME() {
	var result = 'PACKET_ZC_ACK_ACCOUNTNAME {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e1
function PACKET_ZC_SPIRITS2() {
	var result = 'PACKET_ZC_SPIRITS2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    num = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e2
function PACKET_ZC_REQ_COUPLE() {
	var result = 'PACKET_ZC_REQ_COUPLE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e3
function PACKET_CZ_JOIN_COUPLE() {
	var result = 'PACKET_CZ_JOIN_COUPLE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    answer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e4
function PACKET_ZC_START_COUPLE() {
	var result = 'PACKET_ZC_START_COUPLE {\n';
	result += '}\n';
	return result;
}

//packet = 0x1e5
function PACKET_CZ_REQ_JOIN_COUPLE() {
	var result = 'PACKET_CZ_REQ_JOIN_COUPLE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e6
function PACKET_ZC_COUPLENAME() {
	var result = 'PACKET_ZC_COUPLENAME {\n';
	result += '    CoupleName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e7
function PACKET_CZ_DORIDORI() {
	var result = 'PACKET_CZ_DORIDORI {\n';
	result += '}\n';
	return result;
}

//packet = 0x1e8
function PACKET_CZ_MAKE_GROUP2() {
	var result = 'PACKET_CZ_MAKE_GROUP2 {\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    ItemPickupRule = ' + parser.fetchByte() + '\n';
	result += '    ItemDivisionRule = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1e9
function PACKET_ZC_ADD_MEMBER_TO_GROUP2() {
	var result = 'PACKET_ZC_ADD_MEMBER_TO_GROUP2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Role = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    ItemPickupRule = ' + parser.fetchByte() + '\n';
	result += '    ItemDivisionRule = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ea
function PACKET_ZC_CONGRATULATION() {
	var result = 'PACKET_ZC_CONGRATULATION {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1eb
function PACKET_ZC_NOTIFY_POSITION_TO_GUILDM() {
	var result = 'PACKET_ZC_NOTIFY_POSITION_TO_GUILDM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ec
function PACKET_ZC_GUILD_MEMBER_MAP_CHANGE() {
	var result = 'PACKET_ZC_GUILD_MEMBER_MAP_CHANGE {\n';
	result += '    GDID = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ed
function PACKET_CZ_CHOPOKGI() {
	var result = 'PACKET_CZ_CHOPOKGI {\n';
	result += '}\n';
	return result;
}

//packet = 0x1ee
function PACKET_ZC_NORMAL_ITEMLIST2() {
	var result = 'PACKET_ZC_NORMAL_ITEMLIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/18;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO2 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1ef
function PACKET_ZC_CART_NORMAL_ITEMLIST2() {
	var result = 'PACKET_ZC_CART_NORMAL_ITEMLIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/18;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO2 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1f0
function PACKET_ZC_STORE_NORMAL_ITEMLIST2() {
	var result = 'PACKET_ZC_STORE_NORMAL_ITEMLIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/18;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO2 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1f1
function PACKET_AC_NOTIFY_ERROR() {
	var result = 'PACKET_AC_NOTIFY_ERROR {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f2
function PACKET_ZC_UPDATE_CHARSTAT2() {
	var result = 'PACKET_ZC_UPDATE_CHARSTAT2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    status = ' + parser.fetchDWord() + '\n';
	result += '    sex = ' + parser.fetchWord() + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    headPalette = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f3
function PACKET_ZC_NOTIFY_EFFECT2() {
	var result = 'PACKET_ZC_NOTIFY_EFFECT2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    effectID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f4
function PACKET_ZC_REQ_EXCHANGE_ITEM2() {
	var result = 'PACKET_ZC_REQ_EXCHANGE_ITEM2 {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f5
function PACKET_ZC_ACK_EXCHANGE_ITEM2() {
	var result = 'PACKET_ZC_ACK_EXCHANGE_ITEM2 {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f6
function PACKET_ZC_REQ_BABY() {
	var result = 'PACKET_ZC_REQ_BABY {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f7
function PACKET_CZ_JOIN_BABY() {
	var result = 'PACKET_CZ_JOIN_BABY {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    answer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1f8
function PACKET_ZC_START_BABY() {
	var result = 'PACKET_ZC_START_BABY {\n';
	result += '}\n';
	return result;
}

//packet = 0x1f9
function PACKET_CZ_REQ_JOIN_BABY() {
	var result = 'PACKET_CZ_REQ_JOIN_BABY {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1fa
function PACKET_CA_LOGIN3() {
	var result = 'PACKET_CA_LOGIN3 {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    PasswdMD5 = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '    ClientInfo = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1fb
function PACKET_CH_DELETE_CHAR2() {
	var result = 'PACKET_CH_DELETE_CHAR2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    key = ' + '"' + parser.fetchString(50) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1fc
function PACKET_ZC_REPAIRITEMLIST() {
	var result = 'PACKET_ZC_REPAIRITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemList = parser.remainingLength()/13;
		for (var i = 0; i < itemList; i++) {
			result += '    REPAIRITEM_INFO itemList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x1fd
function PACKET_CZ_REQ_ITEMREPAIR() {
	var result = 'PACKET_CZ_REQ_ITEMREPAIR {\n';
	{
		result += '    REPAIRITEM_INFO TargetItemInfo {\n';
		result += '        index = ' + parser.fetchWord() + '\n';
		result += '        ITID = ' + getItemInfo() + '\n';
		result += '        refiningLevel = ' + parser.fetchByte() + '\n';
		{
			result += '        EQUIPSLOTINFO slot {\n';
			result += '            card1 = ' + getItemInfo() + '\n';
			result += '            card2 = ' + getItemInfo() + '\n';
			result += '            card3 = ' + getItemInfo() + '\n';
			result += '            card4 = ' + getItemInfo() + '\n';
			result += '        }\n';
		}
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x1fe
function PACKET_ZC_ACK_ITEMREPAIR() {
	var result = 'PACKET_ZC_ACK_ITEMREPAIR {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x1ff
function PACKET_ZC_HIGHJUMP() {
	var result = 'PACKET_ZC_HIGHJUMP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x200
function PACKET_CA_CONNECT_INFO_CHANGED() {
	var result = 'PACKET_CA_CONNECT_INFO_CHANGED {\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x201
function PACKET_ZC_FRIENDS_LIST() {
	var result = 'PACKET_ZC_FRIENDS_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var friendList = parser.remainingLength()/32;
		for (var i = 0; i < friendList; i++) {
			result += '    STRUCT_FRIEND friendList[' + i + '] {\n';
			result += '        AID = ' + parser.fetchDWord() + '\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x202
function PACKET_CZ_ADD_FRIENDS() {
	var result = 'PACKET_CZ_ADD_FRIENDS {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x203
function PACKET_CZ_DELETE_FRIENDS() {
	var result = 'PACKET_CZ_DELETE_FRIENDS {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x204
function PACKET_CA_EXE_HASHCHECK() {
	var result = 'PACKET_CA_EXE_HASHCHECK {\n';
	result += '    HashValue = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x205
function PACKET_ZC_DIVORCE() {
	var result = 'PACKET_ZC_DIVORCE {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x206
function PACKET_ZC_FRIENDS_STATE() {
	var result = 'PACKET_ZC_FRIENDS_STATE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    State = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x207
function PACKET_ZC_REQ_ADD_FRIENDS() {
	var result = 'PACKET_ZC_REQ_ADD_FRIENDS {\n';
	result += '    ReqAID = ' + parser.fetchDWord() + '\n';
	result += '    ReqGID = ' + parser.fetchDWord() + '\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x208
function PACKET_CZ_ACK_REQ_ADD_FRIENDS() {
	var result = 'PACKET_CZ_ACK_REQ_ADD_FRIENDS {\n';
	result += '    ReqAID = ' + parser.fetchDWord() + '\n';
	result += '    ReqGID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x209
function PACKET_ZC_ADD_FRIENDS_LIST() {
	var result = 'PACKET_ZC_ADD_FRIENDS_LIST {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x20a
function PACKET_ZC_DELETE_FRIENDS() {
	var result = 'PACKET_ZC_DELETE_FRIENDS {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x20b
function PACKET_CH_EXE_HASHCHECK() {
	var result = 'PACKET_CH_EXE_HASHCHECK {\n';
	result += '    ClientType = ' + parser.fetchByte() + '\n';
	result += '    HashValue = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x20c
function PACKET_CZ_EXE_HASHCHECK() {
	var result = 'PACKET_CZ_EXE_HASHCHECK {\n';
	result += '    ClientType = ' + parser.fetchByte() + '\n';
	result += '    HashValue = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x20d
function PACKET_HC_BLOCK_CHARACTER() {
	var result = 'PACKET_HC_BLOCK_CHARACTER {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var characterList = parser.remainingLength()/24;
		for (var i = 0; i < characterList; i++) {
			result += '    TAG_CHARACTER_BLOCK_INFO characterList[' + i + '] {\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        szExpireDate = ' + '"' + parser.fetchString(20) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x20e
function PACKET_ZC_STARSKILL() {
	var result = 'PACKET_ZC_STARSKILL {\n';
	result += '    mapName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    monsterID = ' + parser.fetchDWord() + '\n';
	result += '    star = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x20f
function PACKET_CZ_REQ_PVPPOINT() {
	var result = 'PACKET_CZ_REQ_PVPPOINT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x210
function PACKET_ZC_ACK_PVPPOINT() {
	var result = 'PACKET_ZC_ACK_PVPPOINT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	{
		result += '    PVPINFO PVP {\n';
		result += '        WinPoint = ' + parser.fetchDWord() + '\n';
		result += '        LosePoint = ' + parser.fetchDWord() + '\n';
		result += '        Point = ' + parser.fetchDWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x211
function PACKET_ZH_MOVE_PVPWORLD() {
	var result = 'PACKET_ZH_MOVE_PVPWORLD {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x212
function PACKET_CZ_REQ_GIVE_MANNER_BYNAME() {
	var result = 'PACKET_CZ_REQ_GIVE_MANNER_BYNAME {\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x213
function PACKET_CZ_REQ_STATUS_GM() {
	var result = 'PACKET_CZ_REQ_STATUS_GM {\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x214
function PACKET_ZC_ACK_STATUS_GM() {
	var result = 'PACKET_ZC_ACK_STATUS_GM {\n';
	result += '    str = ' + parser.fetchByte() + '\n';
	result += '    standardStr = ' + parser.fetchByte() + '\n';
	result += '    agi = ' + parser.fetchByte() + '\n';
	result += '    standardAgi = ' + parser.fetchByte() + '\n';
	result += '    vit = ' + parser.fetchByte() + '\n';
	result += '    standardVit = ' + parser.fetchByte() + '\n';
	result += '    Int = ' + parser.fetchByte() + '\n';
	result += '    standardInt = ' + parser.fetchByte() + '\n';
	result += '    dex = ' + parser.fetchByte() + '\n';
	result += '    standardDex = ' + parser.fetchByte() + '\n';
	result += '    luk = ' + parser.fetchByte() + '\n';
	result += '    standardLuk = ' + parser.fetchByte() + '\n';
	result += '    attPower = ' + parser.fetchWord() + '\n';
	result += '    refiningPower = ' + parser.fetchWord() + '\n';
	result += '    max_mattPower = ' + parser.fetchWord() + '\n';
	result += '    min_mattPower = ' + parser.fetchWord() + '\n';
	result += '    itemdefPower = ' + parser.fetchWord() + '\n';
	result += '    plusdefPower = ' + parser.fetchWord() + '\n';
	result += '    mdefPower = ' + parser.fetchWord() + '\n';
	result += '    plusmdefPower = ' + parser.fetchWord() + '\n';
	result += '    hitSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    avoidSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    plusAvoidSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    criticalSuccessValue = ' + parser.fetchWord() + '\n';
	result += '    ASPD = ' + parser.fetchWord() + '\n';
	result += '    plusASPD = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x215
function PACKET_ZC_SKILLMSG() {
	var result = 'PACKET_ZC_SKILLMSG {\n';
	result += '    MsgNo = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x216
function PACKET_ZC_BABYMSG() {
	var result = 'PACKET_ZC_BABYMSG {\n';
	result += '    MsgNo = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x217
function PACKET_CZ_BLACKSMITH_RANK() {
	var result = 'PACKET_CZ_BLACKSMITH_RANK {\n';
	result += '}\n';
	return result;
}

//packet = 0x218
function PACKET_CZ_ALCHEMIST_RANK() {
	var result = 'PACKET_CZ_ALCHEMIST_RANK {\n';
	result += '}\n';
	return result;
}

//packet = 0x219
function PACKET_ZC_BLACKSMITH_RANK() {
	var result = 'PACKET_ZC_BLACKSMITH_RANK {\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x21a
function PACKET_ZC_ALCHEMIST_RANK() {
	var result = 'PACKET_ZC_ALCHEMIST_RANK {\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x21b
function PACKET_ZC_BLACKSMITH_POINT() {
	var result = 'PACKET_ZC_BLACKSMITH_POINT {\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    TotalPoint = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x21c
function PACKET_ZC_ALCHEMIST_POINT() {
	var result = 'PACKET_ZC_ALCHEMIST_POINT {\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    TotalPoint = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x21d
function PACKET_CZ_LESSEFFECT() {
	var result = 'PACKET_CZ_LESSEFFECT {\n';
	result += '    isLess = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x21e
function PACKET_ZC_LESSEFFECT() {
	var result = 'PACKET_ZC_LESSEFFECT {\n';
	result += '    isLess = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x21f
function PACKET_ZC_NOTIFY_PKINFO() {
	var result = 'PACKET_ZC_NOTIFY_PKINFO {\n';
	result += '    winPoint = ' + parser.fetchDWord() + '\n';
	result += '    losePoint = ' + parser.fetchDWord() + '\n';
	result += '    killName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    killedName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	{
		result += '    _FILETIME expireTime {\n';
		result += '        dwLowDateTime = ' + parser.fetchDWord() + '\n';
		result += '        dwHighDateTime = ' + parser.fetchDWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x220
function PACKET_ZC_NOTIFY_CRAZYKILLER() {
	var result = 'PACKET_ZC_NOTIFY_CRAZYKILLER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    isCrazyKiller = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x221
function PACKET_ZC_NOTIFY_WEAPONITEMLIST() {
	var result = 'PACKET_ZC_NOTIFY_WEAPONITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var itemList = parser.remainingLength()/13;
		for (var i = 0; i < itemList; i++) {
			result += '    REPAIRITEM_INFO itemList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x222
function PACKET_CZ_REQ_WEAPONREFINE() {
	var result = 'PACKET_CZ_REQ_WEAPONREFINE {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x223
function PACKET_ZC_ACK_WEAPONREFINE() {
	var result = 'PACKET_ZC_ACK_WEAPONREFINE {\n';
	result += '    msg = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x224
function PACKET_ZC_TAEKWON_POINT() {
	var result = 'PACKET_ZC_TAEKWON_POINT {\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    TotalPoint = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x225
function PACKET_CZ_TAEKWON_RANK() {
	var result = 'PACKET_CZ_TAEKWON_RANK {\n';
	result += '}\n';
	return result;
}

//packet = 0x226
function PACKET_ZC_TAEKWON_RANK() {
	var result = 'PACKET_ZC_TAEKWON_RANK {\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x227
function PACKET_ZC_GAME_GUARD() {
	var result = 'PACKET_ZC_GAME_GUARD {\n';
	result += '    AuthData = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x228
function PACKET_CZ_ACK_GAME_GUARD() {
	var result = 'PACKET_CZ_ACK_GAME_GUARD {\n';
	result += '    AuthData = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x229
function PACKET_ZC_STATE_CHANGE3() {
	var result = 'PACKET_ZC_STATE_CHANGE3 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x22a
function PACKET_ZC_NOTIFY_STANDENTRY3() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY3 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x22b
function PACKET_ZC_NOTIFY_NEWENTRY3() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY3 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x22c
function PACKET_ZC_NOTIFY_MOVEENTRY3() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY3 {\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x22d
function PACKET_CZ_COMMAND_MER() {
	var result = 'PACKET_CZ_COMMAND_MER {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '    command = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x22e
function PACKET_ZC_PROPERTY_HOMUN() {
	var result = 'PACKET_ZC_PROPERTY_HOMUN {\n';
	result += '    szName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    bModified = ' + parser.fetchByte() + '\n';
	result += '    nLevel = ' + parser.fetchWord() + '\n';
	result += '    nFullness = ' + parser.fetchWord() + '\n';
	result += '    nRelationship = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    atk = ' + parser.fetchWord() + '\n';
	result += '    Matk = ' + parser.fetchWord() + '\n';
	result += '    hit = ' + parser.fetchWord() + '\n';
	result += '    critical = ' + parser.fetchWord() + '\n';
	result += '    def = ' + parser.fetchWord() + '\n';
	result += '    Mdef = ' + parser.fetchWord() + '\n';
	result += '    flee = ' + parser.fetchWord() + '\n';
	result += '    aspd = ' + parser.fetchWord() + '\n';
	result += '    hp = ' + parser.fetchWord() + '\n';
	result += '    maxHP = ' + parser.fetchWord() + '\n';
	result += '    sp = ' + parser.fetchWord() + '\n';
	result += '    maxSP = ' + parser.fetchWord() + '\n';
	result += '    exp = ' + parser.fetchDWord() + '\n';
	result += '    maxEXP = ' + parser.fetchDWord() + '\n';
	result += '    SKPoint = ' + parser.fetchWord() + '\n';
	result += '    ATKRange = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x230
function PACKET_ZC_CHANGESTATE_MER() {
	var result = 'PACKET_ZC_CHANGESTATE_MER {\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    data = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x231
function PACKET_CZ_RENAME_MER() {
	var result = 'PACKET_CZ_RENAME_MER {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x232
function PACKET_CZ_REQUEST_MOVENPC() {
	var result = 'PACKET_CZ_REQUEST_MOVENPC {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    dest = ' + getPos() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x233
function PACKET_CZ_REQUEST_ACTNPC() {
	var result = 'PACKET_CZ_REQUEST_ACTNPC {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x234
function PACKET_CZ_REQUEST_MOVETOOWNER() {
	var result = 'PACKET_CZ_REQUEST_MOVETOOWNER {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x23a
function PACKET_ZC_REQ_STORE_PASSWORD() {
	var result = 'PACKET_ZC_REQ_STORE_PASSWORD {\n';
	result += '    Info = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x23b
function PACKET_CZ_ACK_STORE_PASSWORD() {
	var result = 'PACKET_CZ_ACK_STORE_PASSWORD {\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '    Password = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    NewPassword = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x23c
function PACKET_ZC_RESULT_STORE_PASSWORD() {
	var result = 'PACKET_ZC_RESULT_STORE_PASSWORD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    ErrorCount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x23d
function PACKET_AC_EVENT_RESULT() {
	var result = 'PACKET_AC_EVENT_RESULT {\n';
	result += '    EventItemCount = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x23e
function PACKET_HC_REQUEST_CHARACTER_PASSWORD() {
	var result = 'PACKET_HC_REQUEST_CHARACTER_PASSWORD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    dummyValue = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x23f
function PACKET_CZ_MAIL_GET_LIST() {
	var result = 'PACKET_CZ_MAIL_GET_LIST {\n';
	result += '}\n';
	return result;
}

//packet = 0x240
function PACKET_ZC_MAIL_REQ_GET_LIST() {
	var result = 'PACKET_ZC_MAIL_REQ_GET_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    MailNumber = ' + parser.fetchDWord() + '\n';
	{
		var mailList = parser.remainingLength()/73;
		for (var i = 0; i < mailList; i++) {
			result += '    MAIL_LIST mailList[' + i + '] {\n';
			result += '        MailID = ' + parser.fetchDWord() + '\n';
			result += '        HEADER = ' + '"' + parser.fetchString(40) + '"' + '\n';
			result += '        isOpen = ' + parser.fetchByte() + '\n';
			result += '        FromName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        DeleteTime = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x241
function PACKET_CZ_MAIL_OPEN() {
	var result = 'PACKET_CZ_MAIL_OPEN {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x242
function PACKET_ZC_MAIL_REQ_OPEN() {
	var result = 'PACKET_ZC_MAIL_REQ_OPEN {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '    Header = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '    FromName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    DeleteTime = ' + parser.fetchDWord() + '\n';
	result += '    Money = ' + parser.fetchDWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '    msg_len = ' + parser.fetchByte() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x243
function PACKET_CZ_MAIL_DELETE() {
	var result = 'PACKET_CZ_MAIL_DELETE {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x244
function PACKET_CZ_MAIL_GET_ITEM() {
	var result = 'PACKET_CZ_MAIL_GET_ITEM {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x245
function PACKET_ZC_MAIL_REQ_GET_ITEM() {
	var result = 'PACKET_ZC_MAIL_REQ_GET_ITEM {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x246
function PACKET_CZ_MAIL_RESET_ITEM() {
	var result = 'PACKET_CZ_MAIL_RESET_ITEM {\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x247
function PACKET_CZ_MAIL_ADD_ITEM() {
	var result = 'PACKET_CZ_MAIL_ADD_ITEM {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x248
function PACKET_CZ_MAIL_SEND() {
	var result = 'PACKET_CZ_MAIL_SEND {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    ReceiveName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Header = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '    msg_len = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x249
function PACKET_ZC_MAIL_REQ_SEND() {
	var result = 'PACKET_ZC_MAIL_REQ_SEND {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x24a
function PACKET_ZC_MAIL_RECEIVE() {
	var result = 'PACKET_ZC_MAIL_RECEIVE {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '    Header = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '    FromName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x24b
function PACKET_CZ_AUCTION_CREATE() {
	var result = 'PACKET_CZ_AUCTION_CREATE {\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x24c
function PACKET_CZ_AUCTION_ADD_ITEM() {
	var result = 'PACKET_CZ_AUCTION_ADD_ITEM {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x24d
function PACKET_CZ_AUCTION_ADD() {
	var result = 'PACKET_CZ_AUCTION_ADD {\n';
	result += '    NowMoney = ' + parser.fetchDWord() + '\n';
	result += '    MaxMoney = ' + parser.fetchDWord() + '\n';
	result += '    DeleteHour = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x24e
function PACKET_CZ_AUCTION_ADD_CANCEL() {
	var result = 'PACKET_CZ_AUCTION_ADD_CANCEL {\n';
	result += '    AuctionID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x24f
function PACKET_CZ_AUCTION_BUY() {
	var result = 'PACKET_CZ_AUCTION_BUY {\n';
	result += '    AuctionID = ' + parser.fetchDWord() + '\n';
	result += '    Money = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x250
function PACKET_ZC_AUCTION_RESULT() {
	var result = 'PACKET_ZC_AUCTION_RESULT {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x251
function PACKET_CZ_AUCTION_ITEM_SEARCH() {
	var result = 'PACKET_CZ_AUCTION_ITEM_SEARCH {\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '    AuctionID = ' + parser.fetchDWord() + '\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Page = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x252
function PACKET_ZC_AUCTION_ITEM_REQ_SEARCH() {
	var result = 'PACKET_ZC_AUCTION_ITEM_REQ_SEARCH {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    MaxPage = ' + parser.fetchDWord() + '\n';
	result += '    Number = ' + parser.fetchDWord() + '\n';
	{
		var auctionItemList = parser.remainingLength()/83;
		for (var i = 0; i < auctionItemList; i++) {
			result += '    AUCTION_ITEM_SEARCH_INFO auctionItemList[' + i + '] {\n';
			result += '        AuctionID = ' + parser.fetchDWord() + '\n';
			result += '        SellerName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        Type = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        NowPrice = ' + parser.fetchDWord() + '\n';
			result += '        MaxPrice = ' + parser.fetchDWord() + '\n';
			result += '        BuyerName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        DeleteTime = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x253
function PACKET_ZC_STARPLACE() {
	var result = 'PACKET_ZC_STARPLACE {\n';
	result += '    which = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x254
function PACKET_CZ_AGREE_STARPLACE() {
	var result = 'PACKET_CZ_AGREE_STARPLACE {\n';
	result += '    which = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x255
function PACKET_ZC_ACK_MAIL_ADD_ITEM() {
	var result = 'PACKET_ZC_ACK_MAIL_ADD_ITEM {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x256
function PACKET_ZC_ACK_AUCTION_ADD_ITEM() {
	var result = 'PACKET_ZC_ACK_AUCTION_ADD_ITEM {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x257
function PACKET_ZC_ACK_MAIL_DELETE() {
	var result = 'PACKET_ZC_ACK_MAIL_DELETE {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x258
function PACKET_CA_REQ_GAME_GUARD_CHECK() {
	var result = 'PACKET_CA_REQ_GAME_GUARD_CHECK {\n';
	result += '}\n';
	return result;
}

//packet = 0x259
function PACKET_AC_ACK_GAME_GUARD() {
	var result = 'PACKET_AC_ACK_GAME_GUARD {\n';
	result += '    ucAnswer = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x25a
function PACKET_ZC_MAKINGITEM_LIST() {
	var result = 'PACKET_ZC_MAKINGITEM_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    idList = ' + getWordList(-1) + '\n';
	result += '}\n';
	return result;
}

//packet = 0x25b
function PACKET_CZ_REQ_MAKINGITEM() {
	var result = 'PACKET_CZ_REQ_MAKINGITEM {\n';
	result += '    mkType = ' + parser.fetchWord() + '\n';
	result += '    id = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x25c
function PACKET_CZ_AUCTION_REQ_MY_INFO() {
	var result = 'PACKET_CZ_AUCTION_REQ_MY_INFO {\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x25d
function PACKET_CZ_AUCTION_REQ_MY_SELL_STOP() {
	var result = 'PACKET_CZ_AUCTION_REQ_MY_SELL_STOP {\n';
	result += '    AuctionID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x25e
function PACKET_ZC_AUCTION_ACK_MY_SELL_STOP() {
	var result = 'PACKET_ZC_AUCTION_ACK_MY_SELL_STOP {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x25f
function PACKET_ZC_AUCTION_WINDOWS() {
	var result = 'PACKET_ZC_AUCTION_WINDOWS {\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x260
function PACKET_ZC_MAIL_WINDOWS() {
	var result = 'PACKET_ZC_MAIL_WINDOWS {\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x261
function PACKET_AC_REQ_LOGIN_OLDEKEY() {
	var result = 'PACKET_AC_REQ_LOGIN_OLDEKEY {\n';
	result += '    m_SeedValue = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x262
function PACKET_AC_REQ_LOGIN_NEWEKEY() {
	var result = 'PACKET_AC_REQ_LOGIN_NEWEKEY {\n';
	result += '    m_SeedValue = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x263
function PACKET_AC_REQ_LOGIN_CARDPASS() {
	var result = 'PACKET_AC_REQ_LOGIN_CARDPASS {\n';
	result += '    m_SeedValue = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x264
function PACKET_CA_ACK_LOGIN_OLDEKEY() {
	var result = 'PACKET_CA_ACK_LOGIN_OLDEKEY {\n';
	result += '    m_SeedValue = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '    m_EKey = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x265
function PACKET_CA_ACK_LOGIN_NEWEKEY() {
	var result = 'PACKET_CA_ACK_LOGIN_NEWEKEY {\n';
	result += '    m_SeedValue = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '    m_EKey = ' + '"' + parser.fetchString(9) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x266
function PACKET_CA_ACK_LOGIN_CARDPASS() {
	var result = 'PACKET_CA_ACK_LOGIN_CARDPASS {\n';
	result += '    m_cardPass = ' + '"' + parser.fetchString(28) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x267
function PACKET_AC_ACK_EKEY_FAIL_NOTEXIST() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_NOTEXIST {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x268
function PACKET_AC_ACK_EKEY_FAIL_NOTUSESEKEY() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_NOTUSESEKEY {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x269
function PACKET_AC_ACK_EKEY_FAIL_NOTUSEDEKEY() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_NOTUSEDEKEY {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x26a
function PACKET_AC_ACK_EKEY_FAIL_AUTHREFUSE() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_AUTHREFUSE {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x26b
function PACKET_AC_ACK_EKEY_FAIL_INPUTEKEY() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_INPUTEKEY {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x26c
function PACKET_AC_ACK_EKEY_FAIL_NOTICE() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_NOTICE {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x26d
function PACKET_AC_ACK_EKEY_FAIL_NEEDCARDPASS() {
	var result = 'PACKET_AC_ACK_EKEY_FAIL_NEEDCARDPASS {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x26e
function PACKET_AC_ACK_AUTHEKEY_FAIL_NOTMATCHCARDPASS() {
	var result = 'PACKET_AC_ACK_AUTHEKEY_FAIL_NOTMATCHCARDPASS {\n';
	result += '    errorCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x26f
function PACKET_AC_ACK_FIRST_LOGIN() {
	var result = 'PACKET_AC_ACK_FIRST_LOGIN {\n';
	result += '}\n';
	return result;
}

//packet = 0x270
function PACKET_AC_REQ_LOGIN_ACCOUNT_INFO() {
	var result = 'PACKET_AC_REQ_LOGIN_ACCOUNT_INFO {\n';
	result += '}\n';
	return result;
}

//packet = 0x271
function PACKET_CA_ACK_LOGIN_ACCOUNT_INFO() {
	var result = 'PACKET_CA_ACK_LOGIN_ACCOUNT_INFO {\n';
	result += '    sex = ' + parser.fetchWord() + '\n';
	result += '    bPoint = ' + parser.fetchWord() + '\n';
	result += '    E_mail = ' + '"' + parser.fetchString(34) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x272
function PACKET_AC_ACK_PT_ID_INFO() {
	var result = 'PACKET_AC_ACK_PT_ID_INFO {\n';
	result += '    szPTID = ' + '"' + parser.fetchString(21) + '"' + '\n';
	result += '    szPTNumID = ' + '"' + parser.fetchString(21) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x273
function PACKET_CZ_REQ_MAIL_RETURN() {
	var result = 'PACKET_CZ_REQ_MAIL_RETURN {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '    ReceiveName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x274
function PACKET_ZC_ACK_MAIL_RETURN() {
	var result = 'PACKET_ZC_ACK_MAIL_RETURN {\n';
	result += '    MailID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x275
function PACKET_CH_ENTER2() {
	var result = 'PACKET_CH_ENTER2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    userLevel = ' + parser.fetchDWord() + '\n';
	result += '    clientType = ' + parser.fetchWord() + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	result += '    macData = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    iAccountSID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x276
function PACKET_AC_ACCEPT_LOGIN2() {
	var result = 'PACKET_AC_ACCEPT_LOGIN2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    userLevel = ' + parser.fetchDWord() + '\n';
	result += '    lastLoginIP = ' + parser.fetchDWord() + '\n';
	result += '    lastLoginTime = ' + '"' + parser.fetchString(26) + '"' + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	result += '    iAccountSID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x277
function PACKET_CA_LOGIN_PCBANG() {
	var result = 'PACKET_CA_LOGIN_PCBANG {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Passwd = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '    IP = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    MacAdress = ' + '"' + parser.fetchString(13) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x278
function PACKET_ZC_NOTIFY_PCBANG() {
	var result = 'PACKET_ZC_NOTIFY_PCBANG {\n';
	result += '}\n';
	return result;
}

//packet = 0x279
function PACKET_CZ_HUNTINGLIST() {
	var result = 'PACKET_CZ_HUNTINGLIST {\n';
	result += '}\n';
	return result;
}

//packet = 0x27a
function PACKET_ZC_HUNTINGLIST() {
	var result = 'PACKET_ZC_HUNTINGLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var HuntingList = parser.remainingLength()/12;
		for (var i = 0; i < HuntingList; i++) {
			result += '    PACKET_MOB_HUNTING HuntingList[' + i + '] {\n';
			result += '        questID = ' + parser.fetchDWord() + '\n';
			result += '        mobGID = ' + parser.fetchDWord() + '\n';
			result += '        maxCount = ' + parser.fetchWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x27b
function PACKET_ZC_PCBANG_EFFECT() {
	var result = 'PACKET_ZC_PCBANG_EFFECT {\n';
	result += '    ExpFactor = ' + parser.fetchDWord() + '\n';
	result += '    ExpFactor2 = ' + parser.fetchDWord() + '\n';
	result += '    DropFactor = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x27c
function PACKET_CA_LOGIN4() {
	var result = 'PACKET_CA_LOGIN4 {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    PasswdMD5 = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '    macData = ' + '"' + parser.fetchString(13) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x27d
function PACKET_ZC_PROPERTY_MERCE() {
	var result = 'PACKET_ZC_PROPERTY_MERCE {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    faith = ' + parser.fetchWord() + '\n';
	result += '    summonCount = ' + parser.fetchWord() + '\n';
	result += '    atk = ' + parser.fetchWord() + '\n';
	result += '    Matk = ' + parser.fetchWord() + '\n';
	result += '    hit = ' + parser.fetchWord() + '\n';
	result += '    critical = ' + parser.fetchWord() + '\n';
	result += '    def = ' + parser.fetchWord() + '\n';
	result += '    Mdef = ' + parser.fetchWord() + '\n';
	result += '    flee = ' + parser.fetchWord() + '\n';
	result += '    aspd = ' + parser.fetchWord() + '\n';
	result += '    hp = ' + parser.fetchWord() + '\n';
	result += '    maxHP = ' + parser.fetchWord() + '\n';
	result += '    sp = ' + parser.fetchWord() + '\n';
	result += '    maxSP = ' + parser.fetchWord() + '\n';
	result += '    ATKRange = ' + parser.fetchWord() + '\n';
	result += '    exp = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x27e
function PACKET_ZC_SHANDA_PROTECT() {
	var result = 'PACKET_ZC_SHANDA_PROTECT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    CodeLen = ' + parser.fetchWord() + '\n';
	result += '    Code = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x27f
function PACKET_CA_CLIENT_TYPE() {
	var result = 'PACKET_CA_CLIENT_TYPE {\n';
	result += '    ClientType = ' + parser.fetchWord() + '\n';
	result += '    nVer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x280
function PACKET_ZC_GANGSI_POINT() {
	var result = 'PACKET_ZC_GANGSI_POINT {\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    TotalPoint = ' + parser.fetchDWord() + '\n';
	result += '    PacketSwitch = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x281
function PACKET_CZ_GANGSI_RANK() {
	var result = 'PACKET_CZ_GANGSI_RANK {\n';
	result += '    PacketSwitch = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x282
function PACKET_ZC_GANGSI_RANK() {
	var result = 'PACKET_ZC_GANGSI_RANK {\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    PacketSwitch = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x283
function PACKET_ZC_AID() {
	var result = 'PACKET_ZC_AID {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x284
function PACKET_ZC_NOTIFY_EFFECT3() {
	var result = 'PACKET_ZC_NOTIFY_EFFECT3 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    effectID = ' + parser.fetchDWord() + '\n';
	result += '    numdata = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x285
function PACKET_ZC_DEATH_QUESTION() {
	var result = 'PACKET_ZC_DEATH_QUESTION {\n';
	result += '    Qcategory = ' + parser.fetchWord() + '\n';
	result += '    Qnum = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x286
function PACKET_CZ_DEATH_QUESTION() {
	var result = 'PACKET_CZ_DEATH_QUESTION {\n';
	result += '    Qanswer = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x287
function PACKET_ZC_PC_CASH_POINT_ITEMLIST() {
	var result = 'PACKET_ZC_PC_CASH_POINT_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    CashPoint = ' + parser.fetchDWord() + '\n';
	{
		var itemList = parser.remainingLength()/11;
		for (var i = 0; i < itemList; i++) {
			result += '    PURCHASE_ITEM itemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        discountprice = ' + parser.fetchDWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x288
function PACKET_CZ_PC_BUY_CASH_POINT_ITEM() {
	var result = 'PACKET_CZ_PC_BUY_CASH_POINT_ITEM {\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x289
function PACKET_ZC_PC_CASH_POINT_UPDATE() {
	var result = 'PACKET_ZC_PC_CASH_POINT_UPDATE {\n';
	result += '    CashPoint = ' + parser.fetchDWord() + '\n';
	result += '    Error = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x28a
function PACKET_ZC_NPC_SHOWEFST_UPDATE() {
	var result = 'PACKET_ZC_NPC_SHOWEFST_UPDATE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    clevel = ' + parser.fetchDWord() + '\n';
	result += '    showEFST = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x28c
function PACKET_CH_SELECT_CHAR_GOINGTOBEUSED() {
	var result = 'PACKET_CH_SELECT_CHAR_GOINGTOBEUSED {\n';
	result += '    dwAID = ' + parser.fetchDWord() + '\n';
	result += '    nCountSelectedChar = ' + parser.fetchDWord() + '\n';
	result += '    ardwSelectedGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x28d
function PACKET_CH_REQ_IS_VALID_CHARNAME() {
	var result = 'PACKET_CH_REQ_IS_VALID_CHARNAME {\n';
	result += '    dwAID = ' + parser.fetchDWord() + '\n';
	result += '    dwGID = ' + parser.fetchDWord() + '\n';
	result += '    szCharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x28e
function PACKET_HC_ACK_IS_VALID_CHARNAME() {
	var result = 'PACKET_HC_ACK_IS_VALID_CHARNAME {\n';
	result += '    sResult = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x28f
function PACKET_CH_REQ_CHANGE_CHARNAME() {
	var result = 'PACKET_CH_REQ_CHANGE_CHARNAME {\n';
	result += '    dwGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x290
function PACKET_HC_ACK_CHANGE_CHARNAME() {
	var result = 'PACKET_HC_ACK_CHANGE_CHARNAME {\n';
	result += '    sResult = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x291
function PACKET_ZC_MSG() {
	var result = 'PACKET_ZC_MSG {\n';
	result += '    msg = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x292
function PACKET_CZ_STANDING_RESURRECTION() {
	var result = 'PACKET_CZ_STANDING_RESURRECTION {\n';
	result += '}\n';
	return result;
}

//packet = 0x293
function PACKET_ZC_BOSS_INFO() {
	var result = 'PACKET_ZC_BOSS_INFO {\n';
	result += '    infoType = ' + parser.fetchByte() + '\n';
	result += '    xPos = ' + parser.fetchDWord() + '\n';
	result += '    yPos = ' + parser.fetchDWord() + '\n';
	result += '    minHour = ' + parser.fetchWord() + '\n';
	result += '    minMinute = ' + parser.fetchWord() + '\n';
	result += '    maxHour = ' + parser.fetchWord() + '\n';
	result += '    maxMinute = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(51) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x294
function PACKET_ZC_READ_BOOK() {
	var result = 'PACKET_ZC_READ_BOOK {\n';
	result += '    bookID = ' + parser.fetchDWord() + '\n';
	result += '    page = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x295
function PACKET_ZC_EQUIPMENT_ITEMLIST2() {
	var result = 'PACKET_ZC_EQUIPMENT_ITEMLIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/24;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO2 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x296
function PACKET_ZC_STORE_EQUIPMENT_ITEMLIST2() {
	var result = 'PACKET_ZC_STORE_EQUIPMENT_ITEMLIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/24;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO2 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x297
function PACKET_ZC_CART_EQUIPMENT_ITEMLIST2() {
	var result = 'PACKET_ZC_CART_EQUIPMENT_ITEMLIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/24;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO2 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x298
function PACKET_ZC_CASH_TIME_COUNTER() {
	var result = 'PACKET_ZC_CASH_TIME_COUNTER {\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    RemainSecond = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x299
function PACKET_ZC_CASH_ITEM_DELETE() {
	var result = 'PACKET_ZC_CASH_ITEM_DELETE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x29a
function PACKET_ZC_ITEM_PICKUP_ACK2() {
	var result = 'PACKET_ZC_ITEM_PICKUP_ACK2 {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '    location = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '    HireExpireDate = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x29b
function PACKET_ZC_MER_INIT() {
	var result = 'PACKET_ZC_MER_INIT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    atk = ' + parser.fetchWord() + '\n';
	result += '    Matk = ' + parser.fetchWord() + '\n';
	result += '    hit = ' + parser.fetchWord() + '\n';
	result += '    critical = ' + parser.fetchWord() + '\n';
	result += '    def = ' + parser.fetchWord() + '\n';
	result += '    Mdef = ' + parser.fetchWord() + '\n';
	result += '    flee = ' + parser.fetchWord() + '\n';
	result += '    aspd = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    hp = ' + parser.fetchDWord() + '\n';
	result += '    maxHP = ' + parser.fetchDWord() + '\n';
	result += '    sp = ' + parser.fetchDWord() + '\n';
	result += '    maxSP = ' + parser.fetchDWord() + '\n';
	result += '    ExpireDate = ' + parser.fetchDWord() + '\n';
	result += '    faith = ' + parser.fetchWord() + '\n';
	result += '    toal_call_num = ' + parser.fetchDWord() + '\n';
	result += '    approval_monster_kill_counter = ' + parser.fetchDWord() + '\n';
	result += '    ATKRange = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x29c
function PACKET_ZC_MER_PROPERTY() {
	var result = 'PACKET_ZC_MER_PROPERTY {\n';
	result += '    atk = ' + parser.fetchWord() + '\n';
	result += '    Matk = ' + parser.fetchWord() + '\n';
	result += '    hit = ' + parser.fetchWord() + '\n';
	result += '    critical = ' + parser.fetchWord() + '\n';
	result += '    def = ' + parser.fetchWord() + '\n';
	result += '    Mdef = ' + parser.fetchWord() + '\n';
	result += '    flee = ' + parser.fetchWord() + '\n';
	result += '    aspd = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    hp = ' + parser.fetchWord() + '\n';
	result += '    maxHP = ' + parser.fetchWord() + '\n';
	result += '    sp = ' + parser.fetchWord() + '\n';
	result += '    maxSP = ' + parser.fetchWord() + '\n';
	result += '    ExpireDate = ' + parser.fetchDWord() + '\n';
	result += '    faith = ' + parser.fetchWord() + '\n';
	result += '    toal_call_num = ' + parser.fetchDWord() + '\n';
	result += '    approval_monster_kill_counter = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x29d
function PACKET_ZC_MER_SKILLINFO_LIST() {
	var result = 'PACKET_ZC_MER_SKILLINFO_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var skillList = parser.remainingLength()/37;
		for (var i = 0; i < skillList; i++) {
			result += '    SKILLINFO skillList[' + i + '] {\n';
			result += '        SKID = ' + getSkillInfo() + '\n';
			result += '        type = ' + parser.fetchDWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        spcost = ' + parser.fetchWord() + '\n';
			result += '        attackRange = ' + parser.fetchWord() + '\n';
			result += '        skillName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        upgradable = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x29e
function PACKET_ZC_MER_SKILLINFO_UPDATE() {
	var result = 'PACKET_ZC_MER_SKILLINFO_UPDATE {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    spcost = ' + parser.fetchWord() + '\n';
	result += '    attackRange = ' + parser.fetchWord() + '\n';
	result += '    upgradable = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x29f
function PACKET_CZ_MER_COMMAND() {
	var result = 'PACKET_CZ_MER_COMMAND {\n';
	result += '    command = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2a0
function UNUSED_PACKET_CZ_MER_USE_SKILL() {
	var result = 'UNUSED_PACKET_CZ_MER_USE_SKILL {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2a1
function UNUSED_PACKET_CZ_MER_UPGRADE_SKILLLEVEL() {
	var result = 'UNUSED_PACKET_CZ_MER_UPGRADE_SKILLLEVEL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2a2
function PACKET_ZC_MER_PAR_CHANGE() {
	var result = 'PACKET_ZC_MER_PAR_CHANGE {\n';
	result += '    var = ' + parser.fetchWord() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2a3
function PACKET_ZC_GAMEGUARD_LINGO_KEY() {
	var result = 'PACKET_ZC_GAMEGUARD_LINGO_KEY {\n';
	result += '    packetType = ' + parser.fetchWord() + '\n';
	{
		result += '    PGG_LINGO_KEY_TEMP lingoKey {\n';
		result += '        dwAlgNum = ' + parser.fetchDWord() + '\n';
		result += '        dwAlgKey1 = ' + parser.fetchDWord() + '\n';
		result += '        dwAlgKey2 = ' + parser.fetchDWord() + '\n';
		result += '        dwSeed = ' + parser.fetchDWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x2a5
function PACKET_CZ_KSY_EVENT() {
	var result = 'PACKET_CZ_KSY_EVENT {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2aa
function PACKET_ZC_REQ_CASH_PASSWORD() {
	var result = 'PACKET_ZC_REQ_CASH_PASSWORD {\n';
	result += '    Info = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ab
function PACKET_CZ_ACK_CASH_PASSWORD() {
	var result = 'PACKET_CZ_ACK_CASH_PASSWORD {\n';
	result += '    Type = ' + parser.fetchWord() + '\n';
	result += '    Password = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    NewPassword = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ac
function PACKET_ZC_RESULT_CASH_PASSWORD() {
	var result = 'PACKET_ZC_RESULT_CASH_PASSWORD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    ErrorCount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ad
function PACKET_AC_REQUEST_SECOND_PASSWORD() {
	var result = 'PACKET_AC_REQUEST_SECOND_PASSWORD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    dwSeed = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2b0
function PACKET_CA_LOGIN_HAN() {
	var result = 'PACKET_CA_LOGIN_HAN {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Passwd = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '    m_szIP = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    m_szMacAddr = ' + '"' + parser.fetchString(13) + '"' + '\n';
	result += '    isHanGameUser = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2b1
function PACKET_ZC_ALL_QUEST_LIST() {
	var result = 'PACKET_ZC_ALL_QUEST_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    questCount = ' + parser.fetchDWord() + '\n';
	{
		var QuestList = parser.remainingLength()/5;
		for (var i = 0; i < QuestList; i++) {
			result += '    PACKET_ZC_QUEST_INFO QuestList[' + i + '] {\n';
			result += '        questID = ' + parser.fetchDWord() + '\n';
			result += '        active = ' + parser.fetchBool() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2b2
function PACKET_ZC_ALL_QUEST_MISSION() {
	var result = 'PACKET_ZC_ALL_QUEST_MISSION {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	{
		var QuestMissionList = parser.remainingLength()/104;
		for (var i = 0; i < QuestMissionList; i++) {
			result += '    PACKET_ZC_QUEST_MISSION_INFO QuestMissionList[' + i + '] {\n';
			result += '        questID = ' + parser.fetchDWord() + '\n';
			result += '        quest_svrTime = ' + parser.fetchDWord() + '\n';
			result += '        quest_endTime = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			{
				for (var i = 0; i < 3; i++) {
					result += '        PACKET_ZC_MISSION_HUNT hunt[' + i + '] {\n';
					result += '            mobGID = ' + parser.fetchDWord() + '\n';
					result += '            huntCount = ' + parser.fetchWord() + '\n';
					result += '            mobName = ' + '"' + parser.fetchString(24) + '"' + '\n';
					result += '        }\n';
				}
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2b3
function PACKET_ZC_ADD_QUEST() {
	var result = 'PACKET_ZC_ADD_QUEST {\n';
	result += '    questID = ' + parser.fetchDWord() + '\n';
	result += '    active = ' + parser.fetchBool() + '\n';
	result += '    quest_svrTime = ' + parser.fetchDWord() + '\n';
	result += '    quest_endTime = ' + parser.fetchDWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	{
		for (var i = 0; i < 3; i++) {
			result += '    PACKET_ZC_MISSION_HUNT hunt[' + i + '] {\n';
			result += '        mobGID = ' + parser.fetchDWord() + '\n';
			result += '        huntCount = ' + parser.fetchWord() + '\n';
			result += '        mobName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2b4
function PACKET_ZC_DEL_QUEST() {
	var result = 'PACKET_ZC_DEL_QUEST {\n';
	result += '    questID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2b5
function PACKET_ZC_UPDATE_MISSION_HUNT() {
	var result = 'PACKET_ZC_UPDATE_MISSION_HUNT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	{
		var MobHuntList = parser.remainingLength()/12;
		for (var i = 0; i < MobHuntList; i++) {
			result += '    PACKET_MOB_HUNTING MobHuntList[' + i + '] {\n';
			result += '        questID = ' + parser.fetchDWord() + '\n';
			result += '        mobGID = ' + parser.fetchDWord() + '\n';
			result += '        maxCount = ' + parser.fetchWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2b6
function PACKET_CZ_ACTIVE_QUEST() {
	var result = 'PACKET_CZ_ACTIVE_QUEST {\n';
	result += '    questID = ' + parser.fetchDWord() + '\n';
	result += '    active = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2b7
function PACKET_ZC_ACTIVE_QUEST() {
	var result = 'PACKET_ZC_ACTIVE_QUEST {\n';
	result += '    questID = ' + parser.fetchDWord() + '\n';
	result += '    active = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2b8
function PACKET_ZC_ITEM_PICKUP_PARTY() {
	var result = 'PACKET_ZC_ITEM_PICKUP_PARTY {\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '    location = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2b9
function PACKET_ZC_SHORTCUT_KEY_LIST() {
	var result = 'PACKET_ZC_SHORTCUT_KEY_LIST {\n';
	{
		for (var i = 0; i < 27; i++) {
			result += '    ShortCutKey ShortCutKey[' + i + '] {\n';
			result += '        isSkill = ' + parser.fetchByte() + '\n';
			result += '        ID = ' + getSkillOrItemInfo() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2ba
function PACKET_CZ_SHORTCUT_KEY_CHANGE() {
	var result = 'PACKET_CZ_SHORTCUT_KEY_CHANGE {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	{
		result += '    ShortCutKey ShortCutKey {\n';
		result += '        isSkill = ' + parser.fetchByte() + '\n';
		result += '        ID = ' + getSkillOrItemInfo() + '\n';
		result += '        count = ' + parser.fetchWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x2bb
function PACKET_ZC_EQUIPITEM_DAMAGED() {
	var result = 'PACKET_ZC_EQUIPITEM_DAMAGED {\n';
	result += '    wearLocation = ' + parser.fetchWord() + '\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2bc
function PACKET_ZC_NOTIFY_PCBANG_PLAYING_TIME() {
	var result = 'PACKET_ZC_NOTIFY_PCBANG_PLAYING_TIME {\n';
	result += '    TimeMinute = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2bf
function PACKET_ZC_SRPACKETR2_INIT() {
	var result = 'PACKET_ZC_SRPACKETR2_INIT {\n';
	result += '    ProtectFactor = ' + parser.fetchWord() + '\n';
	result += '    DeformSeedFactor = ' + parser.fetchDWord() + '\n';
	result += '    DeformAddFactor = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c0
function PACKET_CZ_SRPACKETR2_START() {
	var result = 'PACKET_CZ_SRPACKETR2_START {\n';
	result += '    ProtectFactor = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c1
function PACKET_ZC_NPC_CHAT() {
	var result = 'PACKET_ZC_NPC_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '    color = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c2
function PACKET_ZC_FORMATSTRING_MSG() {
	var result = 'PACKET_ZC_FORMATSTRING_MSG {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + parser.fetchWord() + '\n';
	result += '    value = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c4
function PACKET_CZ_PARTY_JOIN_REQ() {
	var result = 'PACKET_CZ_PARTY_JOIN_REQ {\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c5
function PACKET_ZC_PARTY_JOIN_REQ_ACK() {
	var result = 'PACKET_ZC_PARTY_JOIN_REQ_ACK {\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    answer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c6
function PACKET_ZC_PARTY_JOIN_REQ() {
	var result = 'PACKET_ZC_PARTY_JOIN_REQ {\n';
	result += '    GRID = ' + parser.fetchDWord() + '\n';
	result += '    groupName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c7
function PACKET_CZ_PARTY_JOIN_REQ_ACK() {
	var result = 'PACKET_CZ_PARTY_JOIN_REQ_ACK {\n';
	result += '    GRID = ' + parser.fetchDWord() + '\n';
	result += '    bAccept = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c8
function PACKET_CZ_PARTY_CONFIG() {
	var result = 'PACKET_CZ_PARTY_CONFIG {\n';
	result += '    bRefuseJoinMsg = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2c9
function PACKET_ZC_PARTY_CONFIG() {
	var result = 'PACKET_ZC_PARTY_CONFIG {\n';
	result += '    bRefuseJoinMsg = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ca
function PACKET_HC_REFUSE_SELECTCHAR() {
	var result = 'PACKET_HC_REFUSE_SELECTCHAR {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2cb
function PACKET_ZC_MEMORIALDUNGEON_SUBSCRIPTION_INFO() {
	var result = 'PACKET_ZC_MEMORIALDUNGEON_SUBSCRIPTION_INFO {\n';
	result += '    MemorialDungeonName = ' + '"' + parser.fetchString(61) + '"' + '\n';
	result += '    PriorityOrderNum = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2cc
function PACKET_ZC_MEMORIALDUNGEON_SUBSCRIPTION_NOTIFY() {
	var result = 'PACKET_ZC_MEMORIALDUNGEON_SUBSCRIPTION_NOTIFY {\n';
	result += '    PriorityOrderNum = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2cd
function PACKET_ZC_MEMORIALDUNGEON_INFO() {
	var result = 'PACKET_ZC_MEMORIALDUNGEON_INFO {\n';
	result += '    MemorialDungeonName = ' + '"' + parser.fetchString(61) + '"' + '\n';
	result += '    DestroyDate = ' + parser.fetchDWord() + '\n';
	result += '    EnterTimeOutDate = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ce
function PACKET_ZC_MEMORIALDUNGEON_NOTIFY() {
	var result = 'PACKET_ZC_MEMORIALDUNGEON_NOTIFY {\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '    EnterLimitDate = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2cf
function PACKET_CZ_MEMORIALDUNGEON_COMMAND() {
	var result = 'PACKET_CZ_MEMORIALDUNGEON_COMMAND {\n';
	result += '    Command = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2d0
function PACKET_ZC_EQUIPMENT_ITEMLIST3() {
	var result = 'PACKET_ZC_EQUIPMENT_ITEMLIST3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/28;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO301 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2d1
function PACKET_ZC_STORE_EQUIPMENT_ITEMLIST3() {
	var result = 'PACKET_ZC_STORE_EQUIPMENT_ITEMLIST3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/28;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO301 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2d2
function PACKET_ZC_CART_EQUIPMENT_ITEMLIST3() {
	var result = 'PACKET_ZC_CART_EQUIPMENT_ITEMLIST3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/28;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO301 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2d3
function PACKET_ZC_NOTIFY_BIND_ON_EQUIP() {
	var result = 'PACKET_ZC_NOTIFY_BIND_ON_EQUIP {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2d4
function PACKET_ZC_ITEM_PICKUP_ACK3() {
	var result = 'PACKET_ZC_ITEM_PICKUP_ACK3 {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '    location = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '    HireExpireDate = ' + parser.fetchDWord() + '\n';
	result += '    bindOnEquipType = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2d5
function PACKET_ZC_ISVR_DISCONNECT() {
	var result = 'PACKET_ZC_ISVR_DISCONNECT {\n';
	result += '}\n';
	return result;
}

//packet = 0x2d6
function PACKET_CZ_EQUIPWIN_MICROSCOPE() {
	var result = 'PACKET_CZ_EQUIPWIN_MICROSCOPE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2d7
function PACKET_ZC_EQUIPWIN_MICROSCOPE() {
	var result = 'PACKET_ZC_EQUIPWIN_MICROSCOPE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	{
		var ItemInfo = parser.remainingLength()/28;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    EQUIPMENTITEM_EXTRAINFO301 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        IsDamaged = ' + parser.fetchBool() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2d8
function PACKET_CZ_CONFIG() {
	var result = 'PACKET_CZ_CONFIG {\n';
	result += '    Config = ' + parser.fetchDWord() + '\n';
	result += '    Value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2d9
function PACKET_ZC_CONFIG() {
	var result = 'PACKET_ZC_CONFIG {\n';
	result += '    Config = ' + parser.fetchDWord() + '\n';
	result += '    Value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2da
function PACKET_ZC_CONFIG_NOTIFY() {
	var result = 'PACKET_ZC_CONFIG_NOTIFY {\n';
	result += '    bOpenEquipmentWin = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2db
function PACKET_CZ_BATTLEFIELD_CHAT() {
	var result = 'PACKET_CZ_BATTLEFIELD_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2dc
function PACKET_ZC_BATTLEFIELD_CHAT() {
	var result = 'PACKET_ZC_BATTLEFIELD_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2dd
function PACKET_ZC_BATTLEFIELD_NOTIFY_CAMPINFO() {
	var result = 'PACKET_ZC_BATTLEFIELD_NOTIFY_CAMPINFO {\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    camp = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2de
function PACKET_ZC_BATTLEFIELD_NOTIFY_POINT() {
	var result = 'PACKET_ZC_BATTLEFIELD_NOTIFY_POINT {\n';
	result += '    pointCampA = ' + parser.fetchWord() + '\n';
	result += '    pointCampB = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2df
function PACKET_ZC_BATTLEFIELD_NOTIFY_POSITION() {
	var result = 'PACKET_ZC_BATTLEFIELD_NOTIFY_POSITION {\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    x = ' + parser.fetchWord() + '\n';
	result += '    y = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2e0
function PACKET_ZC_BATTLEFIELD_NOTIFY_HP() {
	var result = 'PACKET_ZC_BATTLEFIELD_NOTIFY_HP {\n';
	result += '    accountID = ' + parser.fetchDWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    hp = ' + parser.fetchWord() + '\n';
	result += '    maxHp = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2e1
function PACKET_ZC_NOTIFY_ACT2() {
	var result = 'PACKET_ZC_NOTIFY_ACT2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    attackMT = ' + parser.fetchDWord() + '\n';
	result += '    attackedMT = ' + parser.fetchDWord() + '\n';
	result += '    damage = ' + parser.fetchDWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '    leftDamage = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2e6
function PACKET_CZ_BOT_CHECK() {
	var result = 'PACKET_CZ_BOT_CHECK {\n';
	result += '    IsBot = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2e7
function PACKET_ZC_MAPPROPERTY() {
	var result = 'PACKET_ZC_MAPPROPERTY {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '    mapInfoTable = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2e8
function PACKET_ZC_NORMAL_ITEMLIST3() {
	var result = 'PACKET_ZC_NORMAL_ITEMLIST3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/22;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO3 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2e9
function PACKET_ZC_CART_NORMAL_ITEMLIST3() {
	var result = 'PACKET_ZC_CART_NORMAL_ITEMLIST3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/22;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO3 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2ea
function PACKET_ZC_STORE_NORMAL_ITEMLIST3() {
	var result = 'PACKET_ZC_STORE_NORMAL_ITEMLIST3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var ItemInfo = parser.remainingLength()/22;
		for (var i = 0; i < ItemInfo; i++) {
			result += '    NORMALITEM_EXTRAINFO3 ItemInfo[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        IsIdentified = ' + parser.fetchBool() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x2eb
function PACKET_ZC_ACCEPT_ENTER2() {
	var result = 'PACKET_ZC_ACCEPT_ENTER2 {\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ec
function PACKET_ZC_NOTIFY_MOVEENTRY4() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY4 {\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ed
function PACKET_ZC_NOTIFY_NEWENTRY4() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY4 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ee
function PACKET_ZC_NOTIFY_STANDENTRY4() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY4 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2ef
function PACKET_ZC_NOTIFY_FONT() {
	var result = 'PACKET_ZC_NOTIFY_FONT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2f0
function PACKET_ZC_PROGRESS() {
	var result = 'PACKET_ZC_PROGRESS {\n';
	result += '    color = ' + parser.fetchDWord() + '\n';
	result += '    time = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2f1
function PACKET_CZ_PROGRESS() {
	var result = 'PACKET_CZ_PROGRESS {\n';
	result += '}\n';
	return result;
}

//packet = 0x2f2
function PACKET_ZC_PROGRESS_CANCEL() {
	var result = 'PACKET_ZC_PROGRESS_CANCEL {\n';
	result += '}\n';
	return result;
}

//packet = 0x2f3
function PACKET_CZ_IRMAIL_SEND() {
	var result = 'PACKET_CZ_IRMAIL_SEND {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    ReceiveName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Title = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '    Zeny = ' + parser.fetchDWord() + '\n';
	{
		result += '    PACKET_CZ_IRMAIL_SEND tagItem {\n';
		result += '        index = ' + parser.fetchWord() + '\n';
		result += '        id = ' + parser.fetchWord() + '\n';
		result += '        cnt = ' + parser.fetchWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x2f4
function PACKET_ZC_IRMAIL_SEND_RES() {
	var result = 'PACKET_ZC_IRMAIL_SEND_RES {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x2f5
function PACKET_ZC_IRMAIL_NOTIFY() {
	var result = 'PACKET_ZC_IRMAIL_NOTIFY {\n';
	{
		result += '    IRMAILID MailID {\n';
		result += '        office = ' + parser.fetchByte() + '\n';
		result += '        id = ' + parser.fetchDWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x2f6
function PACKET_CZ_IRMAIL_LIST() {
	var result = 'PACKET_CZ_IRMAIL_LIST {\n';
	{
		result += '    IRMAILID MailID {\n';
		result += '        office = ' + parser.fetchByte() + '\n';
		result += '        id = ' + parser.fetchDWord() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x35c
function PACKET_CZ_OPEN_SIMPLE_CASHSHOP_ITEMLIST() {
	var result = 'PACKET_CZ_OPEN_SIMPLE_CASHSHOP_ITEMLIST {\n';
	result += '}\n';
	return result;
}

//packet = 0x35d
function PACKET_ZC_SIMPLE_CASHSHOP_POINT_ITEMLIST() {
	var result = 'PACKET_ZC_SIMPLE_CASHSHOP_POINT_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    CashPoint = ' + parser.fetchDWord() + '\n';
	result += '    md_itemcount = ' + parser.fetchWord() + '\n';
	result += '    md_itemSize = ' + parser.fetchWord() + '\n';
	result += '    best_itemcount = ' + parser.fetchWord() + '\n';
	result += '    best_itemsize = ' + parser.fetchWord() + '\n';
	{
		var ItemList = parser.remainingLength()/11;
		for (var i = 0; i < ItemList; i++) {
			result += '    PURCHASE_ITEM ItemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        discountprice = ' + parser.fetchDWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x35e
function PACKET_CZ_CLOSE_WINDOW() {
	var result = 'PACKET_CZ_CLOSE_WINDOW {\n';
	result += '}\n';
	return result;
}

//packet = 0x35f
function PACKET_CZ_REQUEST_MOVE2() {
	var result = 'PACKET_CZ_REQUEST_MOVE2 {\n';
	result += '    dest = ' + getPos() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x360
function PACKET_CZ_REQUEST_TIME2() {
	var result = 'PACKET_CZ_REQUEST_TIME2 {\n';
	result += '    clientTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x361
function PACKET_CZ_CHANGE_DIRECTION2() {
	var result = 'PACKET_CZ_CHANGE_DIRECTION2 {\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    dir = ' + getDir() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x362
function PACKET_CZ_ITEM_PICKUP2() {
	var result = 'PACKET_CZ_ITEM_PICKUP2 {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x363
function PACKET_CZ_ITEM_THROW2() {
	var result = 'PACKET_CZ_ITEM_THROW2 {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x364
function PACKET_CZ_MOVE_ITEM_FROM_BODY_TO_STORE2() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_BODY_TO_STORE2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x365
function PACKET_CZ_MOVE_ITEM_FROM_STORE_TO_BODY2() {
	var result = 'PACKET_CZ_MOVE_ITEM_FROM_STORE_TO_BODY2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x366
function PACKET_CZ_USE_SKILL_TOGROUND2() {
	var result = 'PACKET_CZ_USE_SKILL_TOGROUND2 {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x367
function PACKET_CZ_USE_SKILL_TOGROUND_WITHTALKBOX2() {
	var result = 'PACKET_CZ_USE_SKILL_TOGROUND_WITHTALKBOX2 {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    contents = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x368
function PACKET_CZ_REQNAME2() {
	var result = 'PACKET_CZ_REQNAME2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x369
function PACKET_CZ_REQNAME_BYGID2() {
	var result = 'PACKET_CZ_REQNAME_BYGID2 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x3de
function PACKET_CAH_ACK_GAME_GUARD() {
	var result = 'PACKET_CAH_ACK_GAME_GUARD {\n';
	result += '    AuthData = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x436
function PACKET_CZ_ENTER2() {
	var result = 'PACKET_CZ_ENTER2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    clientTime = ' + parser.fetchDWord() + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x437
function PACKET_CZ_REQUEST_ACT2() {
	var result = 'PACKET_CZ_REQUEST_ACT2 {\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x438
function PACKET_CZ_USE_SKILL2() {
	var result = 'PACKET_CZ_USE_SKILL2 {\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x439
function PACKET_CZ_USE_ITEM2() {
	var result = 'PACKET_CZ_USE_ITEM2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x43d
function PACKET_ZC_SKILL_POSTDELAY() {
	var result = 'PACKET_ZC_SKILL_POSTDELAY {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    DelayTM = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x43e
function PACKET_ZC_SKILL_POSTDELAY_LIST() {
	var result = 'PACKET_ZC_SKILL_POSTDELAY_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var delayList = parser.remainingLength()/6;
		for (var i = 0; i < delayList; i++) {
			result += '    SKILL_POSTDELAY delayList[' + i + '] {\n';
			result += '        SKID = ' + getSkillInfo() + '\n';
			result += '        DelayTM = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x43f
function PACKET_ZC_MSG_STATE_CHANGE2() {
	var result = 'PACKET_ZC_MSG_STATE_CHANGE2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    state = ' + parser.fetchBool() + '\n';
	result += '    RemainMS = ' + parser.fetchDWord() + '\n';
	result += '    val = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x440
function PACKET_ZC_MILLENNIUMSHIELD() {
	var result = 'PACKET_ZC_MILLENNIUMSHIELD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    num = ' + parser.fetchWord() + '\n';
	result += '    state = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x441
function PACKET_ZC_SKILLINFO_DELETE() {
	var result = 'PACKET_ZC_SKILLINFO_DELETE {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x442
function PACKET_ZC_SKILL_SELECT_REQUEST() {
	var result = 'PACKET_ZC_SKILL_SELECT_REQUEST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    why = ' + parser.fetchDWord() + '\n';
	result += '    SKIDList = ' + getWordList(-1) + '\n';
	result += '}\n';
	return result;
}

//packet = 0x443
function PACKET_CZ_SKILL_SELECT_RESPONSE() {
	var result = 'PACKET_CZ_SKILL_SELECT_RESPONSE {\n';
	result += '    why = ' + parser.fetchDWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x444
function PACKET_ZC_SIMPLE_CASH_POINT_ITEMLIST() {
	var result = 'PACKET_ZC_SIMPLE_CASH_POINT_ITEMLIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    CashPoint = ' + parser.fetchDWord() + '\n';
	{
		var ItemList = parser.remainingLength()/11;
		for (var i = 0; i < ItemList; i++) {
			result += '    PURCHASE_ITEM ItemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        discountprice = ' + parser.fetchDWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x445
function PACKET_CZ_SIMPLE_BUY_CASH_POINT_ITEM() {
	var result = 'PACKET_CZ_SIMPLE_BUY_CASH_POINT_ITEM {\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x446
function PACKET_ZC_QUEST_NOTIFY_EFFECT() {
	var result = 'PACKET_ZC_QUEST_NOTIFY_EFFECT {\n';
	result += '    npcID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    effect = ' + parser.fetchWord() + '\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x447
function PACKET_CZ_BLOCKING_PLAY_CANCEL() {
	var result = 'PACKET_CZ_BLOCKING_PLAY_CANCEL {\n';
	result += '}\n';
	return result;
}

//packet = 0x448
function PACKET_HC_CHARACTER_LIST() {
	var result = 'PACKET_HC_CHARACTER_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var CharacterList = parser.remainingLength()/5;
		for (var i = 0; i < CharacterList; i++) {
			result += '    CHARACTER_LIST CharacterList[' + i + '] {\n';
			result += '        dwGID = ' + parser.fetchDWord() + '\n';
			result += '        SlotIdx = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x449
function PACKET_ZC_HACKSH_ERROR_MSG() {
	var result = 'PACKET_ZC_HACKSH_ERROR_MSG {\n';
	result += '    ErrorID = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x44a
function PACKET_CZ_CLIENT_VERSION() {
	var result = 'PACKET_CZ_CLIENT_VERSION {\n';
	result += '    clientVer = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x44b
function PACKET_CZ_CLOSE_SIMPLECASH_SHOP() {
	var result = 'PACKET_CZ_CLOSE_SIMPLECASH_SHOP {\n';
	result += '}\n';
	return result;
}

//packet = 0x7d0
function PACKET_ZC_ES_RESULT() {
	var result = 'PACKET_ZC_ES_RESULT {\n';
	result += '    esNo = ' + parser.fetchWord() + '\n';
	result += '    esMsg = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d1
function PACKET_CZ_ES_GET_LIST() {
	var result = 'PACKET_CZ_ES_GET_LIST {\n';
	result += '}\n';
	return result;
}

//packet = 0x7d2
function PACKET_ZC_ES_LIST() {
	var result = 'PACKET_ZC_ES_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d3
function PACKET_CZ_ES_CHOOSE() {
	var result = 'PACKET_CZ_ES_CHOOSE {\n';
	result += '    esNo = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d4
function PACKET_CZ_ES_CANCEL() {
	var result = 'PACKET_CZ_ES_CANCEL {\n';
	result += '    esNo = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d5
function PACKET_ZC_ES_READY() {
	var result = 'PACKET_ZC_ES_READY {\n';
	result += '    esNo = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d6
function PACKET_ZC_ES_GOTO() {
	var result = 'PACKET_ZC_ES_GOTO {\n';
	result += '    esNo = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d7
function PACKET_CZ_GROUPINFO_CHANGE_V2() {
	var result = 'PACKET_CZ_GROUPINFO_CHANGE_V2 {\n';
	result += '    expOption = ' + parser.fetchDWord() + '\n';
	result += '    ItemPickupRule = ' + parser.fetchByte() + '\n';
	result += '    ItemDivisionRule = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d8
function PACKET_ZC_REQ_GROUPINFO_CHANGE_V2() {
	var result = 'PACKET_ZC_REQ_GROUPINFO_CHANGE_V2 {\n';
	result += '    expOption = ' + parser.fetchDWord() + '\n';
	result += '    ItemPickupRule = ' + parser.fetchByte() + '\n';
	result += '    ItemDivisionRule = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7d9
function PACKET_ZC_SHORTCUT_KEY_LIST_V2() {
	var result = 'PACKET_ZC_SHORTCUT_KEY_LIST_V2 {\n';
	{
		for (var i = 0; i < 38; i++) {
			result += '    ShortCutKey ShortCutKey[' + i + '] {\n';
			result += '        isSkill = ' + parser.fetchByte() + '\n';
			result += '        ID = ' + getSkillOrItemInfo() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x7da
function PACKET_CZ_CHANGE_GROUP_MASTER() {
	var result = 'PACKET_CZ_CHANGE_GROUP_MASTER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7db
function PACKET_ZC_HO_PAR_CHANGE() {
	var result = 'PACKET_ZC_HO_PAR_CHANGE {\n';
	result += '    var = ' + parser.fetchWord() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7dc
function PACKET_CZ_SEEK_PARTY() {
	var result = 'PACKET_CZ_SEEK_PARTY {\n';
	result += '    Option = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7dd
function PACKET_ZC_SEEK_PARTY() {
	var result = 'PACKET_ZC_SEEK_PARTY {\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Job = ' + getJobInfo(4) + '\n';
	result += '    Level = ' + parser.fetchDWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    Option = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7de
function PACKET_CZ_SEEK_PARTY_MEMBER() {
	var result = 'PACKET_CZ_SEEK_PARTY_MEMBER {\n';
	result += '    Job = ' + getJobInfo(4) + '\n';
	result += '    Level = ' + parser.fetchDWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    Option = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7df
function PACKET_ZC_SEEK_PARTY_MEMBER() {
	var result = 'PACKET_ZC_SEEK_PARTY_MEMBER {\n';
	result += '    Name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Job = ' + getJobInfo(4) + '\n';
	result += '    Level = ' + parser.fetchDWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    Option = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e0
function PACKET_ZC_ES_NOTI_MYINFO() {
	var result = 'PACKET_ZC_ES_NOTI_MYINFO {\n';
	result += '    esNo = ' + parser.fetchWord() + '\n';
	result += '    esname = ' + '"' + parser.fetchString(54) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e1
function PACKET_ZC_SKILLINFO_UPDATE2() {
	var result = 'PACKET_ZC_SKILLINFO_UPDATE2 {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    type = ' + parser.fetchDWord() + '\n';
	result += '    level = ' + parser.fetchWord() + '\n';
	result += '    spcost = ' + parser.fetchWord() + '\n';
	result += '    attackRange = ' + parser.fetchWord() + '\n';
	result += '    upgradable = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e2
function PACKET_ZC_MSG_VALUE() {
	var result = 'PACKET_ZC_MSG_VALUE {\n';
	result += '    msg = ' + parser.fetchWord() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e3
function PACKET_ZC_ITEMLISTWIN_OPEN() {
	var result = 'PACKET_ZC_ITEMLISTWIN_OPEN {\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e4
function PACKET_CZ_ITEMLISTWIN_RES() {
	var result = 'PACKET_CZ_ITEMLISTWIN_RES {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Type = ' + parser.fetchDWord() + '\n';
	result += '    Action = ' + parser.fetchDWord() + '\n';
	result += '    MaterialList = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e5
function PACKET_CH_ENTER_CHECKBOT() {
	var result = 'PACKET_CH_ENTER_CHECKBOT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    dwAID = ' + parser.fetchDWord() + '\n';
	result += '    szStringInfo = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e6
function PACKET_ZC_MSG_SKILL() {
	var result = 'PACKET_ZC_MSG_SKILL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    MSGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e7
function PACKET_CH_CHECKBOT() {
	var result = 'PACKET_CH_CHECKBOT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    dwAID = ' + parser.fetchDWord() + '\n';
	result += '    szStringInfo = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e8
function PACKET_HC_CHECKBOT() {
	var result = 'PACKET_HC_CHECKBOT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    img = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7e9
function PACKET_HC_CHECKBOT_RESULT() {
	var result = 'PACKET_HC_CHECKBOT_RESULT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7ea
function PACKET_CZ_BATTLE_FIELD_LIST() {
	var result = 'PACKET_CZ_BATTLE_FIELD_LIST {\n';
	result += '}\n';
	return result;
}

//packet = 0x7eb
function PACKET_ZC_BATTLE_FIELD_LIST() {
	var result = 'PACKET_ZC_BATTLE_FIELD_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Count = ' + parser.fetchWord() + '\n';
	result += '    ack_type = ' + parser.fetchWord() + '\n';
	{
		var InfoList = parser.remainingLength()/62;
		for (var i = 0; i < InfoList; i++) {
			result += '    BATTLE_FIELD_INFO InfoList[' + i + '] {\n';
			result += '        BFNO = ' + parser.fetchDWord() + '\n';
			result += '        BattleFieldName = ' + '"' + parser.fetchString(56) + '"' + '\n';
			result += '        JoinTeam = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x7ec
function PACKET_CZ_JOIN_BATTLE_FIELD() {
	var result = 'PACKET_CZ_JOIN_BATTLE_FIELD {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '    JoinTeam = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7ed
function PACKET_ZC_JOIN_BATTLE_FIELD() {
	var result = 'PACKET_ZC_JOIN_BATTLE_FIELD {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '    JoinTeam = ' + parser.fetchWord() + '\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7ee
function PACKET_CZ_CANCEL_BATTLE_FIELD() {
	var result = 'PACKET_CZ_CANCEL_BATTLE_FIELD {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7ef
function PACKET_ZC_CANCEL_BATTLE_FIELD() {
	var result = 'PACKET_ZC_CANCEL_BATTLE_FIELD {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f0
function PACKET_CZ_REQ_BATTLE_STATE_MONITOR() {
	var result = 'PACKET_CZ_REQ_BATTLE_STATE_MONITOR {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '    PowerSwitch = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f1
function PACKET_ZC_ACK_BATTLE_STATE_MONITOR() {
	var result = 'PACKET_ZC_ACK_BATTLE_STATE_MONITOR {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '    PlayCount = ' + parser.fetchWord() + '\n';
	result += '    BattleState = ' + parser.fetchWord() + '\n';
	result += '    TeamCount_A = ' + parser.fetchWord() + '\n';
	result += '    TeamCount_B = ' + parser.fetchWord() + '\n';
	result += '    MyCount = ' + parser.fetchWord() + '\n';
	result += '    JoinTeam = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f2
function PACKET_ZC_BATTLE_NOTI_START_STEP() {
	var result = 'PACKET_ZC_BATTLE_NOTI_START_STEP {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f3
function PACKET_ZC_BATTLE_JOIN_NOTI_DEFER() {
	var result = 'PACKET_ZC_BATTLE_JOIN_NOTI_DEFER {\n';
	result += '    BFNO = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f4
function PACKET_ZC_BATTLE_JOIN_DISABLE_STATE() {
	var result = 'PACKET_ZC_BATTLE_JOIN_DISABLE_STATE {\n';
	result += '    Enable = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f5
function PACKET_CZ_GM_FULLSTRIP() {
	var result = 'PACKET_CZ_GM_FULLSTRIP {\n';
	result += '    TargetAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f6
function PACKET_ZC_NOTIFY_EXP() {
	var result = 'PACKET_ZC_NOTIFY_EXP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    amount = ' + parser.fetchDWord() + '\n';
	result += '    varID = ' + getVarInfo() + '\n';
	result += '    expType = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f7
function PACKET_ZC_NOTIFY_MOVEENTRY7() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY7 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f8
function PACKET_ZC_NOTIFY_NEWENTRY5() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7f9
function PACKET_ZC_NOTIFY_STANDENTRY5() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7fa
function PACKET_ZC_DELETE_ITEM_FROM_BODY() {
	var result = 'PACKET_ZC_DELETE_ITEM_FROM_BODY {\n';
	result += '    DeleteType = ' + parser.fetchWord() + '\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    Count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7fb
function PACKET_ZC_USESKILL_ACK2() {
	var result = 'PACKET_ZC_USESKILL_ACK2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    property = ' + parser.fetchDWord() + '\n';
	result += '    delayTime = ' + parser.fetchDWord() + '\n';
	result += '    isDisposable = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7fc
function PACKET_ZC_CHANGE_GROUP_MASTER() {
	var result = 'PACKET_ZC_CHANGE_GROUP_MASTER {\n';
	result += '    OldMasterAID = ' + parser.fetchDWord() + '\n';
	result += '    NewMasterAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7fe
function PACKET_ZC_PLAY_NPC_BGM() {
	var result = 'PACKET_ZC_PLAY_NPC_BGM {\n';
	result += '    Bgm = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x7ff
function PACKET_ZC_DEFINE_CHECK() {
	var result = 'PACKET_ZC_DEFINE_CHECK {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Result = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x800
function PACKET_ZC_PC_PURCHASE_ITEMLIST_FROMMC2() {
	var result = 'PACKET_ZC_PC_PURCHASE_ITEMLIST_FROMMC2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    UniqueID = ' + parser.fetchDWord() + '\n';
	{
		var itemList = parser.remainingLength()/22;
		for (var i = 0; i < itemList; i++) {
			result += '    PURCHASE_ITEM_FROMMC itemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        IsIdentified = ' + parser.fetchByte() + '\n';
			result += '        IsDamaged = ' + parser.fetchByte() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x801
function PACKET_CZ_PC_PURCHASE_ITEMLIST_FROMMC2() {
	var result = 'PACKET_CZ_PC_PURCHASE_ITEMLIST_FROMMC2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    UniqueID = ' + parser.fetchDWord() + '\n';
	{
		var itemList = parser.remainingLength()/4;
		for (var i = 0; i < itemList; i++) {
			result += '    CZ_PURCHASE_ITEM_FROMMC itemList[' + i + '] {\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x802
function PACKET_CZ_PARTY_BOOKING_REQ_REGISTER() {
	var result = 'PACKET_CZ_PARTY_BOOKING_REQ_REGISTER {\n';
	{
		result += '    PARTY_BOOKING_DETAIL RegisterInfo {\n';
		result += '        Level = ' + parser.fetchWord() + '\n';
		result += '        MapID = ' + parser.fetchWord() + '\n';
		result += '        Job = ' + getJobInfoList(6,2) + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x803
function PACKET_ZC_PARTY_BOOKING_ACK_REGISTER() {
	var result = 'PACKET_ZC_PARTY_BOOKING_ACK_REGISTER {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x804
function PACKET_CZ_PARTY_BOOKING_REQ_SEARCH() {
	var result = 'PACKET_CZ_PARTY_BOOKING_REQ_SEARCH {\n';
	result += '    Level = ' + parser.fetchWord() + '\n';
	result += '    MapID = ' + parser.fetchWord() + '\n';
	result += '    Job = ' + getJobInfo(2) + '\n';
	result += '    LastIndex = ' + parser.fetchDWord() + '\n';
	result += '    ResultCount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x805
function PACKET_ZC_PARTY_BOOKING_ACK_SEARCH() {
	var result = 'PACKET_ZC_PARTY_BOOKING_ACK_SEARCH {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    IsExistMoreResult = ' + parser.fetchBool() + '\n';
	{
		var Info = parser.remainingLength()/48;
		for (var i = 0; i < Info; i++) {
			result += '    PARTY_BOOKING_AD_INFO Info[' + i + '] {\n';
			result += '        Index = ' + parser.fetchDWord() + '\n';
			result += '        CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        ExpireTime = ' + parser.fetchDWord() + '\n';
			{
				result += '        PARTY_BOOKING_DETAIL Detail {\n';
				result += '            Level = ' + parser.fetchWord() + '\n';
				result += '            MapID = ' + parser.fetchWord() + '\n';
				result += '            Job = ' + getJobInfoList(6,2) + '\n';
				result += '        }\n';
			}
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x806
function PACKET_CZ_PARTY_BOOKING_REQ_DELETE() {
	var result = 'PACKET_CZ_PARTY_BOOKING_REQ_DELETE {\n';
	result += '}\n';
	return result;
}

//packet = 0x807
function PACKET_ZC_PARTY_BOOKING_ACK_DELETE() {
	var result = 'PACKET_ZC_PARTY_BOOKING_ACK_DELETE {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x808
function PACKET_CZ_PARTY_BOOKING_REQ_UPDATE() {
	var result = 'PACKET_CZ_PARTY_BOOKING_REQ_UPDATE {\n';
	result += '    Job = ' + getJobInfoList(6,2) + '\n';
	result += '}\n';
	return result;
}

//packet = 0x809
function PACKET_ZC_PARTY_BOOKING_NOTIFY_INSERT() {
	var result = 'PACKET_ZC_PARTY_BOOKING_NOTIFY_INSERT {\n';
	{
		result += '    PARTY_BOOKING_AD_INFO Info {\n';
		result += '        Index = ' + parser.fetchDWord() + '\n';
		result += '        CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
		result += '        ExpireTime = ' + parser.fetchDWord() + '\n';
		{
			result += '        PARTY_BOOKING_DETAIL Detail {\n';
			result += '            Level = ' + parser.fetchWord() + '\n';
			result += '            MapID = ' + parser.fetchWord() + '\n';
			result += '            Job1 = ' + parser.fetchWord() + '\n';
			result += '            Job2 = ' + parser.fetchWord() + '\n';
			result += '            Job3 = ' + parser.fetchWord() + '\n';
			result += '            Job4 = ' + parser.fetchWord() + '\n';
			result += '            Job5 = ' + parser.fetchWord() + '\n';
			result += '            Job6 = ' + parser.fetchWord() + '\n';
			result += '        }\n';
		}
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x80a
function PACKET_ZC_PARTY_BOOKING_NOTIFY_UPDATE() {
	var result = 'PACKET_ZC_PARTY_BOOKING_NOTIFY_UPDATE {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '    Job1 = ' + parser.fetchWord() + '\n';
	result += '    Job2 = ' + parser.fetchWord() + '\n';
	result += '    Job3 = ' + parser.fetchWord() + '\n';
	result += '    Job4 = ' + parser.fetchWord() + '\n';
	result += '    Job5 = ' + parser.fetchWord() + '\n';
	result += '    Job6 = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x80b
function PACKET_ZC_PARTY_BOOKING_NOTIFY_DELETE() {
	var result = 'PACKET_ZC_PARTY_BOOKING_NOTIFY_DELETE {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x80c
function PACKET_CZ_SIMPLE_CASH_BTNSHOW() {
	var result = 'PACKET_CZ_SIMPLE_CASH_BTNSHOW {\n';
	result += '}\n';
	return result;
}

//packet = 0x80d
function PACKET_ZC_SIMPLE_CASH_BTNSHOW() {
	var result = 'PACKET_ZC_SIMPLE_CASH_BTNSHOW {\n';
	result += '    show = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x80e
function PACKET_ZC_NOTIFY_HP_TO_GROUPM_R2() {
	var result = 'PACKET_ZC_NOTIFY_HP_TO_GROUPM_R2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    hp = ' + parser.fetchDWord() + '\n';
	result += '    maxhp = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x80f
function PACKET_ZC_ADD_EXCHANGE_ITEM2() {
	var result = 'PACKET_ZC_ADD_EXCHANGE_ITEM2 {\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    count = ' + parser.fetchDWord() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x810
function PACKET_ZC_OPEN_BUYING_STORE() {
	var result = 'PACKET_ZC_OPEN_BUYING_STORE {\n';
	result += '    count = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x811
function PACKET_CZ_REQ_OPEN_BUYING_STORE() {
	var result = 'PACKET_CZ_REQ_OPEN_BUYING_STORE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    LimitZeny = ' + parser.fetchDWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '    storeName = ' + '"' + parser.fetchString(80) + '"' + '\n';
	{
		var ItemList = parser.remainingLength()/8;
		for (var i = 0; i < ItemList; i++) {
			result += '    PRODUCTINFO_IN_BUYING_STORE ItemList[' + i + '] {\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x812
function PACKET_ZC_FAILED_OPEN_BUYING_STORE_TO_BUYER() {
	var result = 'PACKET_ZC_FAILED_OPEN_BUYING_STORE_TO_BUYER {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    total_weight = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x813
function PACKET_ZC_MYITEMLIST_BUYING_STORE() {
	var result = 'PACKET_ZC_MYITEMLIST_BUYING_STORE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    limitZeny = ' + parser.fetchDWord() + '\n';
	{
		var ItemList = parser.remainingLength()/9;
		for (var i = 0; i < ItemList; i++) {
			result += '    BUYING_STORE_ITEMLIST ItemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x814
function PACKET_ZC_BUYING_STORE_ENTRY() {
	var result = 'PACKET_ZC_BUYING_STORE_ENTRY {\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '    storeName = ' + '"' + parser.fetchString(80) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x815
function PACKET_CZ_REQ_CLOSE_BUYING_STORE() {
	var result = 'PACKET_CZ_REQ_CLOSE_BUYING_STORE {\n';
	result += '}\n';
	return result;
}

//packet = 0x816
function PACKET_ZC_DISAPPEAR_BUYING_STORE_ENTRY() {
	var result = 'PACKET_ZC_DISAPPEAR_BUYING_STORE_ENTRY {\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x817
function PACKET_CZ_REQ_CLICK_TO_BUYING_STORE() {
	var result = 'PACKET_CZ_REQ_CLICK_TO_BUYING_STORE {\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x818
function PACKET_ZC_ACK_ITEMLIST_BUYING_STORE() {
	var result = 'PACKET_ZC_ACK_ITEMLIST_BUYING_STORE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '    StoreID = ' + parser.fetchDWord() + '\n';
	result += '    limitZeny = ' + parser.fetchDWord() + '\n';
	{
		var ItemList = parser.remainingLength()/9;
		for (var i = 0; i < ItemList; i++) {
			result += '    BUYING_STORE_ITEMLIST ItemList[' + i + '] {\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x819
function PACKET_CZ_REQ_TRADE_BUYING_STORE() {
	var result = 'PACKET_CZ_REQ_TRADE_BUYING_STORE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    makerAID = ' + parser.fetchDWord() + '\n';
	result += '    StoreID = ' + parser.fetchDWord() + '\n';
	{
		var ItemList = parser.remainingLength()/6;
		for (var i = 0; i < ItemList; i++) {
			result += '    TRADE_ITEM_BUYING_STORE ItemList[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x81a
function PACKET_ZC_FAILED_TRADE_BUYING_STORE_TO_BUYER() {
	var result = 'PACKET_ZC_FAILED_TRADE_BUYING_STORE_TO_BUYER {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x81b
function PACKET_ZC_UPDATE_ITEM_FROM_BUYING_STORE() {
	var result = 'PACKET_ZC_UPDATE_ITEM_FROM_BUYING_STORE {\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    limitZeny = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x81c
function PACKET_ZC_ITEM_DELETE_BUYING_STORE() {
	var result = 'PACKET_ZC_ITEM_DELETE_BUYING_STORE {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    zeny = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x81d
function PACKET_ZC_EL_INIT() {
	var result = 'PACKET_ZC_EL_INIT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    hp = ' + parser.fetchDWord() + '\n';
	result += '    maxHP = ' + parser.fetchDWord() + '\n';
	result += '    sp = ' + parser.fetchDWord() + '\n';
	result += '    maxSP = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x81e
function PACKET_ZC_EL_PAR_CHANGE() {
	var result = 'PACKET_ZC_EL_PAR_CHANGE {\n';
	result += '    var = ' + parser.fetchWord() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x81f
function PACKET_ZC_BROADCAST4() {
	var result = 'PACKET_ZC_BROADCAST4 {\n';
	result += '    PakcetType = ' + parser.fetchWord() + '\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Msgtype = ' + parser.fetchByte() + '\n';
	result += '    ColorRGB = ' + parser.fetchDWord() + '\n';
	result += '    msg = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x820
function PACKET_ZC_COSTUME_SPRITE_CHANGE() {
	var result = 'PACKET_ZC_COSTUME_SPRITE_CHANGE {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    value = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x821
function PACKET_AC_OTP_USER() {
	var result = 'PACKET_AC_OTP_USER {\n';
	result += '}\n';
	return result;
}

//packet = 0x822
function PACKET_CA_OTP_AUTH_REQ() {
	var result = 'PACKET_CA_OTP_AUTH_REQ {\n';
	result += '    OTPCode = ' + '"' + parser.fetchString(7) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x823
function PACKET_AC_OTP_AUTH_ACK() {
	var result = 'PACKET_AC_OTP_AUTH_ACK {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    LoginResult = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x824
function PACKET_ZC_FAILED_TRADE_BUYING_STORE_TO_SELLER() {
	var result = 'PACKET_ZC_FAILED_TRADE_BUYING_STORE_TO_SELLER {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x825a
function PACKET_CA_SSO_LOGIN_REQa() {
	var result = 'PACKET_CA_SSO_LOGIN_REQa {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    MacAddr = ' + '"' + parser.fetchString(17) + '"' + '\n';
	result += '    IpAddr = ' + '"' + parser.fetchString(15) + '"' + '\n';
	result += '    t1 = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x825
function PACKET_CA_SSO_LOGIN_REQ() {
	var result = 'PACKET_CA_SSO_LOGIN_REQ {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Passwd = ' + '"' + parser.fetchString(27) + '"' + '\n';
	result += '    MacAdress = ' + '"' + parser.fetchString(17) + '"' + '\n';
	result += '    IP = ' + '"' + parser.fetchString(15) + '"' + '\n';
	result += '    t1 = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x826
function PACKET_AC_SSO_LOGIN_ACK() {
	var result = 'PACKET_AC_SSO_LOGIN_ACK {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x827
function PACKET_CH_DELETE_CHAR3_RESERVED() {
	var result = 'PACKET_CH_DELETE_CHAR3_RESERVED {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x828
function PACKET_HC_DELETE_CHAR3_RESERVED() {
	var result = 'PACKET_HC_DELETE_CHAR3_RESERVED {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchDWord() + '\n';
	result += '    DeleteReservedDate = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x829
function PACKET_CH_DELETE_CHAR3() {
	var result = 'PACKET_CH_DELETE_CHAR3 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Birth = ' + getMove() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x82a
function PACKET_HC_DELETE_CHAR3() {
	var result = 'PACKET_HC_DELETE_CHAR3 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x82b
function PACKET_CH_DELETE_CHAR3_CANCEL() {
	var result = 'PACKET_CH_DELETE_CHAR3_CANCEL {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x82c
function PACKET_HC_DELETE_CHAR3_CANCEL() {
	var result = 'PACKET_HC_DELETE_CHAR3_CANCEL {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x82d
function PACKET_HC_ACCEPT2() {
	var result = 'PACKET_HC_ACCEPT2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    NormalSlotNum = ' + parser.fetchByte() + '\n';
	result += '    PremiumSlotNum = ' + parser.fetchByte() + '\n';
	result += '    BillingSlotNum = ' + parser.fetchByte() + '\n';
	result += '    ProducibleSlotNum = ' + parser.fetchByte() + '\n';
	result += '    ValidSlotNum = ' + parser.fetchByte() + '\n';
	result += '    m_extension = ' + '"' + parser.fetchString(20) + '"' + '\n';
	{
		var charInfo = parser.remainingLength()/116;
		for (var i = 0; i < charInfo; i++) {
			result += '    CHARACTER_INFO_NEO_UNION charInfo[' + i + '] {\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        exp = ' + parser.fetchDWord() + '\n';
			result += '        money = ' + parser.fetchDWord() + '\n';
			result += '        jobexp = ' + parser.fetchDWord() + '\n';
			result += '        joblevel = ' + parser.fetchDWord() + '\n';
			result += '        bodystate = ' + parser.fetchDWord() + '\n';
			result += '        healthstate = ' + parser.fetchDWord() + '\n';
			result += '        effectstate = ' + parser.fetchDWord() + '\n';
			result += '        virtue = ' + parser.fetchDWord() + '\n';
			result += '        honor = ' + parser.fetchDWord() + '\n';
			result += '        jobpoint = ' + parser.fetchWord() + '\n';
			result += '        hp = ' + parser.fetchDWord() + '\n';
			result += '        maxhp = ' + parser.fetchDWord() + '\n';
			result += '        sp = ' + parser.fetchWord() + '\n';
			result += '        maxsp = ' + parser.fetchWord() + '\n';
			result += '        speed = ' + parser.fetchWord() + '\n';
			result += '        job = ' + getJobInfo(2) + '\n';
			result += '        head = ' + parser.fetchWord() + '\n';
			result += '        weapon = ' + parser.fetchWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        sppoint = ' + parser.fetchWord() + '\n';
			result += '        accessory = ' + parser.fetchWord() + '\n';
			result += '        shield = ' + parser.fetchWord() + '\n';
			result += '        accessory2 = ' + parser.fetchWord() + '\n';
			result += '        accessory3 = ' + parser.fetchWord() + '\n';
			result += '        headpalette = ' + parser.fetchWord() + '\n';
			result += '        bodypalette = ' + parser.fetchWord() + '\n';
			result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        Str = ' + parser.fetchByte() + '\n';
			result += '        Agi = ' + parser.fetchByte() + '\n';
			result += '        Vit = ' + parser.fetchByte() + '\n';
			result += '        Int = ' + parser.fetchByte() + '\n';
			result += '        Dex = ' + parser.fetchByte() + '\n';
			result += '        Luk = ' + parser.fetchByte() + '\n';
			result += '        CharNum = ' + parser.fetchByte() + '\n';
			result += '        haircolor = ' + parser.fetchByte() + '\n';
			result += '        bIsChangedCharName = ' + parser.fetchWord() + '\n';
			result += '        Robe = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x835
function PACKET_CZ_SEARCH_STORE_INFO() {
	var result = 'PACKET_CZ_SEARCH_STORE_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    StoreType = ' + parser.fetchByte() + '\n';
	result += '    maxPrice = ' + parser.fetchDWord() + '\n';
	result += '    minPrice = ' + parser.fetchDWord() + '\n';
	result += '    ItemIDListSize = ' + parser.fetchByte() + '\n';
	result += '    CardIDListSize = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x836
function PACKET_ZC_SEARCH_STORE_INFO_ACK() {
	var result = 'PACKET_ZC_SEARCH_STORE_INFO_ACK {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    IsFirstPage = ' + parser.fetchBool() + '\n';
	result += '    IsNexPage = ' + parser.fetchBool() + '\n';
	result += '    RemainedSearchCnt = ' + parser.fetchByte() + '\n';
	{
		var SSI_List = parser.remainingLength()/106;
		for (var i = 0; i < SSI_List; i++) {
			result += '    ResultItemInfo SSI_List[' + i + '] {\n';
			result += '        SSI_ID = ' + parser.fetchDWord() + '\n';
			result += '        AID = ' + parser.fetchDWord() + '\n';
			result += '        StoreName = ' + '"' + parser.fetchString(80) + '"' + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        ItemType = ' + parser.fetchByte() + '\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        refiningLevel = ' + parser.fetchByte() + '\n';
			result += '        card1 = ' + getItemInfo() + '\n';
			result += '        card2 = ' + getItemInfo() + '\n';
			result += '        card3 = ' + getItemInfo() + '\n';
			result += '        card4 = ' + getItemInfo() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x837
function PACKET_ZC_SEARCH_STORE_INFO_FAILED() {
	var result = 'PACKET_ZC_SEARCH_STORE_INFO_FAILED {\n';
	result += '    Reason = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x838
function PACKET_CZ_SEARCH_STORE_INFO_NEXT_PAGE() {
	var result = 'PACKET_CZ_SEARCH_STORE_INFO_NEXT_PAGE {\n';
	result += '}\n';
	return result;
}

//packet = 0x839
function PACKET_ZC_ACK_BAN_GUILD_SSO() {
	var result = 'PACKET_ZC_ACK_BAN_GUILD_SSO {\n';
	result += '    charName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    reasonDesc = ' + '"' + parser.fetchString(40) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x83a
function PACKET_ZC_OPEN_SEARCH_STORE_INFO() {
	var result = 'PACKET_ZC_OPEN_SEARCH_STORE_INFO {\n';
	result += '    OpenType = ' + parser.fetchWord() + '\n';
	result += '    SearchCntMax = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x83b
function PACKET_CZ_CLOSE_SEARCH_STORE_INFO() {
	var result = 'PACKET_CZ_CLOSE_SEARCH_STORE_INFO {\n';
	result += '}\n';
	return result;
}

//packet = 0x83c
function PACKET_CZ_SSILIST_ITEM_CLICK() {
	var result = 'PACKET_CZ_SSILIST_ITEM_CLICK {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    SSI_ID = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x83d
function PACKET_ZC_SSILIST_ITEM_CLICK_ACK() {
	var result = 'PACKET_ZC_SSILIST_ITEM_CLICK_ACK {\n';
	result += '    x = ' + parser.fetchWord() + '\n';
	result += '    y = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x83e
function PACKET_AC_REFUSE_LOGIN_R2() {
	var result = 'PACKET_AC_REFUSE_LOGIN_R2 {\n';
	result += '    ErrorCode = ' + parser.fetchDWord() + '\n';
	result += '    blockDate = ' + '"' + parser.fetchString(20) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x83f
function PACKET_ZC_SEARCH_STORE_OPEN_INFO() {
	var result = 'PACKET_ZC_SEARCH_STORE_OPEN_INFO {\n';
	result += '}\n';
	return result;
}

//packet = 0x841
function PACKET_CH_SELECT_ACCESSIBLE_MAPNAME() {
	var result = 'PACKET_CH_SELECT_ACCESSIBLE_MAPNAME {\n';
	result += '    CharNum = ' + parser.fetchByte() + '\n';
	result += '    mapListNum = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x842
function PACKET_CZ_RECALL_SSO() {
	var result = 'PACKET_CZ_RECALL_SSO {\n';
	result += '    aid = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x843
function PACKET_CZ_REMOVE_AID_SSO() {
	var result = 'PACKET_CZ_REMOVE_AID_SSO {\n';
	result += '    aid = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x844
function PACKET_CZ_SE_CASHSHOP_OPEN() {
	var result = 'PACKET_CZ_SE_CASHSHOP_OPEN {\n';
	result += '}\n';
	return result;
}

//packet = 0x845
function PACKET_ZC_SE_CASHSHOP_OPEN() {
	var result = 'PACKET_ZC_SE_CASHSHOP_OPEN {\n';
	result += '    cash_point = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x846
function PACKET_CZ_REQ_SE_CASH_TAB_CODE() {
	var result = 'PACKET_CZ_REQ_SE_CASH_TAB_CODE {\n';
	result += '    tab_code = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x847
function PACKET_ZC_ACK_SE_CASH_ITEM_LIST() {
	var result = 'PACKET_ZC_ACK_SE_CASH_ITEM_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    item_count = ' + parser.fetchWord() + '\n';
	{
		var items = parser.remainingLength()/8;
		for (var i = 0; i < items; i++) {
			result += '    CASH_ITEM_LIST items[' + i + '] {\n';
			result += '        item_id = ' + parser.fetchDWord() + '\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x848
function PACKET_CZ_SE_PC_BUY_CASHITEM_LIST() {
	var result = 'PACKET_CZ_SE_PC_BUY_CASHITEM_LIST {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    item_count = ' + parser.fetchWord() + '\n';
	{
		var items = parser.remainingLength()/10;
		for (var i = 0; i < items; i++) {
			result += '    CASH_BUY_ITEM items[' + i + '] {\n';
			result += '        item_id = ' + parser.fetchDWord() + '\n';
			result += '        count = ' + parser.fetchDWord() + '\n';
			result += '        tab_code = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x849
function PACKET_ZC_SE_PC_BUY_CASHITEM_RESULT() {
	var result = 'PACKET_ZC_SE_PC_BUY_CASHITEM_RESULT {\n';
	result += '    item_id = ' + parser.fetchDWord() + '\n';
	result += '    result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x84a
function PACKET_CZ_SE_CASHSHOP_CLOSE() {
	var result = 'PACKET_CZ_SE_CASHSHOP_CLOSE {\n';
	result += '}\n';
	return result;
}

//packet = 0x84b
function PACKET_ZC_ITEM_FALL_ENTRY4() {
	var result = 'PACKET_ZC_ITEM_FALL_ENTRY4 {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    subX = ' + parser.fetchByte() + '\n';
	result += '    subY = ' + parser.fetchByte() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x84c
function PACKET_CZ_MACRO_USE_SKILL() {
	var result = 'PACKET_CZ_MACRO_USE_SKILL {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    targetID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x84d
function PACKET_CZ_MACRO_USE_SKILL_TOGROUND() {
	var result = 'PACKET_CZ_MACRO_USE_SKILL_TOGROUND {\n';
	result += '    SKID = ' + getSkillInfo() + '\n';
	result += '    selectedLevel = ' + parser.fetchWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x84e
function PACKET_CZ_MACRO_REQUEST_MOVE() {
	var result = 'PACKET_CZ_MACRO_REQUEST_MOVE {\n';
	result += '    dest = ' + getPos() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x84f
function PACKET_CZ_MACRO_ITEM_PICKUP() {
	var result = 'PACKET_CZ_MACRO_ITEM_PICKUP {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x850
function PACKET_CZ_MACRO_REQUEST_ACT() {
	var result = 'PACKET_CZ_MACRO_REQUEST_ACT {\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x851
function PACKET_ZC_GPK_DYNCODE() {
	var result = 'PACKET_ZC_GPK_DYNCODE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    code = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x852
function PACKET_CZ_GPK_DYNCODE_RELOAD() {
	var result = 'PACKET_CZ_GPK_DYNCODE_RELOAD {\n';
	result += '}\n';
	return result;
}

//packet = 0x855
function PACKET_ZC_MACRO_ITEMPICKUP_FAIL() {
	var result = 'PACKET_ZC_MACRO_ITEMPICKUP_FAIL {\n';
	result += '    ITAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x856
function PACKET_ZC_NOTIFY_MOVEENTRY8() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY8 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x857
function PACKET_ZC_NOTIFY_STANDENTRY7() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY7 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x858
function PACKET_ZC_NOTIFY_NEWENTRY6() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY6 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x859
function PACKET_ZC_EQUIPWIN_MICROSCOPE2() {
	var result = 'PACKET_ZC_EQUIPWIN_MICROSCOPE2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8af
function PACKET_HC_WAITING_LOGIN() {
	var result = 'PACKET_HC_WAITING_LOGIN {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    CurWaitingNum = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b0
function PACKET_CH_WAITING_LOGIN() {
	var result = 'PACKET_CH_WAITING_LOGIN {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    AuthCode = ' + parser.fetchDWord() + '\n';
	result += '    userLevel = ' + parser.fetchDWord() + '\n';
	result += '    clientType = ' + parser.fetchWord() + '\n';
	result += '    Sex = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b4
function PACKET_ZC_START_COLLECTION() {
	var result = 'PACKET_ZC_START_COLLECTION {\n';
	result += '}\n';
	return result;
}

//packet = 0x8b5
function PACKET_CZ_TRYCOLLECTION() {
	var result = 'PACKET_CZ_TRYCOLLECTION {\n';
	result += '    targetAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b6
function PACKET_ZC_TRYCOLLECTION() {
	var result = 'PACKET_ZC_TRYCOLLECTION {\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b7
function PACKET_HC_SECOND_PASSWD_REQ() {
	var result = 'PACKET_HC_SECOND_PASSWD_REQ {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Seed = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b8
function PACKET_CH_SECOND_PASSWD_ACK() {
	var result = 'PACKET_CH_SECOND_PASSWD_ACK {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    SecondPWIdx = ' + getMove() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8b9
function PACKET_HC_SECOND_PASSWD_LOGIN() {
	var result = 'PACKET_HC_SECOND_PASSWD_LOGIN {\n';
	result += '    Seed = ' + parser.fetchDWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8ba
function PACKET_CH_MAKE_SECOND_PASSWD() {
	var result = 'PACKET_CH_MAKE_SECOND_PASSWD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Seed = ' + parser.fetchDWord() + '\n';
	result += '    SecondPWIdx = ' + getMove() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8bb
function PACKET_HC_MAKE_SECOND_PASSWD() {
	var result = 'PACKET_HC_MAKE_SECOND_PASSWD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8bc
function PACKET_CH_DELETE_SECOND_PASSWD() {
	var result = 'PACKET_CH_DELETE_SECOND_PASSWD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Seed = ' + parser.fetchDWord() + '\n';
	result += '    SecondPWIdx = ' + getMove() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8bd
function PACKET_HC_DELETE_SECOND_PASSWD() {
	var result = 'PACKET_HC_DELETE_SECOND_PASSWD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8be
function PACKET_CH_EDIT_SECOND_PASSWD() {
	var result = 'PACKET_CH_EDIT_SECOND_PASSWD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Seed = ' + parser.fetchDWord() + '\n';
	result += '    SecondPWIdx = ' + getMove() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8bf
function PACKET_HC_EDIT_SECOND_PASSWD() {
	var result = 'PACKET_HC_EDIT_SECOND_PASSWD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c0
function PACKET_ZC_ACK_SE_CASH_ITEM_LIST2() {
	var result = 'PACKET_ZC_ACK_SE_CASH_ITEM_LIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    OpenIdentity = ' + parser.fetchDWord() + '\n';
	result += '    item_count = ' + parser.fetchWord() + '\n';
	{
		var ItemList = parser.remainingLength()/6;
		for (var i = 0; i < ItemList; i++) {
			result += '    CASH_ITEM_LIST2 ItemList[' + i + '] {\n';
			result += '        item_id = ' + parser.fetchWord() + '\n';
			result += '        price = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x8c1
function PACKET_CZ_MACRO_START() {
	var result = 'PACKET_CZ_MACRO_START {\n';
	result += '}\n';
	return result;
}

//packet = 0x8c2
function PACKET_CZ_MACRO_STOP() {
	var result = 'PACKET_CZ_MACRO_STOP {\n';
	result += '}\n';
	return result;
}

//packet = 0x8c3
function PACKET_CH_NOT_AVAILABLE_SECOND_PASSWD() {
	var result = 'PACKET_CH_NOT_AVAILABLE_SECOND_PASSWD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    SecondPWIdx = ' + '"' + parser.fetchString(4) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c4
function PACKET_HC_NOT_AVAILABLE_SECOND_PASSWD() {
	var result = 'PACKET_HC_NOT_AVAILABLE_SECOND_PASSWD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    Seed = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c5
function PACKET_CH_AVAILABLE_SECOND_PASSWD() {
	var result = 'PACKET_CH_AVAILABLE_SECOND_PASSWD {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c6
function PACKET_HC_AVAILABLE_SECOND_PASSWD() {
	var result = 'PACKET_HC_AVAILABLE_SECOND_PASSWD {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c7
function PACKET_ZC_SKILL_ENTRY3() {
	var result = 'PACKET_ZC_SKILL_ENTRY3 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    creatorAID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    job = ' + parser.fetchByte() + '\n';
	result += '    RadiusRange = ' + parser.fetchByte() + '\n';
	result += '    isVisible = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c8
function PACKET_ZC_NOTIFY_ACT3() {
	var result = 'PACKET_ZC_NOTIFY_ACT3 {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    targetGID = ' + parser.fetchDWord() + '\n';
	result += '    startTime = ' + parser.fetchDWord() + '\n';
	result += '    attackMT = ' + parser.fetchDWord() + '\n';
	result += '    attackedMT = ' + parser.fetchDWord() + '\n';
	result += '    damage = ' + parser.fetchDWord() + '\n';
	result += '    IsSPDamage = ' + parser.fetchByte() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    action = ' + parser.fetchByte() + '\n';
	result += '    leftDamage = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8c9
function PACKET_CZ_REQ_SCHEDULER_CASHITEM() {
	var result = 'PACKET_CZ_REQ_SCHEDULER_CASHITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0x8cb
function PACKET_ZC_PERSONAL_INFOMATION() {
	var result = 'PACKET_ZC_PERSONAL_INFOMATION {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Exp = ' + parser.fetchWord() + '\n';
	result += '    Death = ' + parser.fetchWord() + '\n';
	result += '    Drop = ' + parser.fetchWord() + '\n';
	{
		var DetailInfo = parser.remainingLength()/6;
		for (var i = 0; i < DetailInfo; i++) {
			result += '    DETAIL_EXP_INFO DetailInfo[' + i + '] {\n';
			result += '        InfoType = ' + parser.fetchByte() + '\n';
			result += '        Exp = ' + parser.fetchWord() + '\n';
			result += '        Death = ' + parser.fetchWord() + '\n';
			result += '        Drop = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x8cc
function PACKET_CA_LOGIN5() {
	var result = 'PACKET_CA_LOGIN5 {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(51) + '"' + '\n';
	result += '    Passwd = ' + '"' + parser.fetchString(51) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8cd
function PACKET_ZC_STOPMOVE_FORCE() {
	var result = 'PACKET_ZC_STOPMOVE_FORCE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8ce
function PACKET_ZC_FAILED_GET_ITEM_FROM_ZONEDA() {
	var result = 'PACKET_ZC_FAILED_GET_ITEM_FROM_ZONEDA {\n';
	result += '}\n';
	return result;
}

//packet = 0x8cf
function PACKET_ZC_SPIRITS_ATTRIBUTE() {
	var result = 'PACKET_ZC_SPIRITS_ATTRIBUTE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    SpritsType = ' + parser.fetchWord() + '\n';
	result += '    Num = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d0
function PACKET_ZC_REQ_WEAR_EQUIP_ACK2() {
	var result = 'PACKET_ZC_REQ_WEAR_EQUIP_ACK2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchWord() + '\n';
	result += '    wItemSpriteNumber = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d1
function PACKET_ZC_REQ_TAKEOFF_EQUIP_ACK2() {
	var result = 'PACKET_ZC_REQ_TAKEOFF_EQUIP_ACK2 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d2
function PACKET_ZC_FASTMOVE() {
	var result = 'PACKET_ZC_FASTMOVE {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    targetXpos = ' + parser.fetchWord() + '\n';
	result += '    targetYpos = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d3
function PACKET_ZC_SE_CASHSHOP_UPDATE() {
	var result = 'PACKET_ZC_SE_CASHSHOP_UPDATE {\n';
	result += '    cash_point = ' + parser.fetchDWord() + '\n';
	result += '    free_point = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d4
function PACKET_CH_REQ_CHANGE_CHARACTER_SLOT() {
	var result = 'PACKET_CH_REQ_CHANGE_CHARACTER_SLOT {\n';
	result += '    beforeCharNum = ' + parser.fetchWord() + '\n';
	result += '    AfterCharNum = ' + parser.fetchWord() + '\n';
	result += '    CurChrSlotCnt = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d5
function PACKET_HC_ACK_CHANGE_CHARACTER_SLOT() {
	var result = 'PACKET_HC_ACK_CHANGE_CHARACTER_SLOT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Reason = ' + parser.fetchWord() + '\n';
	result += '    AfterChrSlotCnt = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d6
function PACKET_ZC_CLEAR_DIALOG() {
	var result = 'PACKET_ZC_CLEAR_DIALOG {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d7
function PACKET_CZ_REQ_ENTRY_QUEUE_APPLY() {
	var result = 'PACKET_CZ_REQ_ENTRY_QUEUE_APPLY {\n';
	result += '    ApplyType = ' + parser.fetchWord() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d8
function PACKET_ZC_ACK_ENTRY_QUEUE_APPLY() {
	var result = 'PACKET_ZC_ACK_ENTRY_QUEUE_APPLY {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8d9
function PACKET_ZC_NOTIFY_ENTRY_QUEUE_APPLY() {
	var result = 'PACKET_ZC_NOTIFY_ENTRY_QUEUE_APPLY {\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Ranking = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8da
function PACKET_CZ_REQ_ENTRY_QUEUE_CANCEL() {
	var result = 'PACKET_CZ_REQ_ENTRY_QUEUE_CANCEL {\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8db
function PACKET_ZC_ACK_ENTRY_QUEUE_CANCEL() {
	var result = 'PACKET_ZC_ACK_ENTRY_QUEUE_CANCEL {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8dc
function PACKET_ZC_NOTIFY_ENTRY_QUEUE_ADMISSION() {
	var result = 'PACKET_ZC_NOTIFY_ENTRY_QUEUE_ADMISSION {\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8dd
function PACKET_CZ_REPLY_ENTRY_QUEUE_ADMISSION() {
	var result = 'PACKET_CZ_REPLY_ENTRY_QUEUE_ADMISSION {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8de
function PACKET_ZC_REPLY_ACK_ENTRY_QUEUE_ADMISSION() {
	var result = 'PACKET_ZC_REPLY_ACK_ENTRY_QUEUE_ADMISSION {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8df
function PACKET_ZC_NOTIFY_LOBBY_ADMISSION() {
	var result = 'PACKET_ZC_NOTIFY_LOBBY_ADMISSION {\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    LobbyName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e0
function PACKET_CZ_REPLY_LOBBY_ADMISSION() {
	var result = 'PACKET_CZ_REPLY_LOBBY_ADMISSION {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    LobbyName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e1
function PACKET_ZC_REPLY_ACK_LOBBY_ADMISSION() {
	var result = 'PACKET_ZC_REPLY_ACK_LOBBY_ADMISSION {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    LobbyName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e2
function PACKET_ZC_NAVIGATION_ACTIVE() {
	var result = 'PACKET_ZC_NAVIGATION_ACTIVE {\n';
	result += '    Type = ' + parser.fetchByte() + '\n';
	result += '    SetType = ' + parser.fetchByte() + '\n';
	result += '    Hide = ' + parser.fetchBool() + '\n';
	result += '    MapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    sprIndex = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e3
function PACKET_HC_UPDATE_CHARINFO() {
	var result = 'PACKET_HC_UPDATE_CHARINFO {\n';
	{
		var charInfo = parser.remainingLength()/144;
		for (var i = 0; i < charInfo; i++) {
			result += '    CHARACTER_INFO_NEO_UNION charInfo[' + i + '] {\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        exp = ' + parser.fetchDWord() + '\n';
			result += '        money = ' + parser.fetchDWord() + '\n';
			result += '        jobexp = ' + parser.fetchDWord() + '\n';
			result += '        joblevel = ' + parser.fetchDWord() + '\n';
			result += '        bodystate = ' + parser.fetchDWord() + '\n';
			result += '        healthstate = ' + parser.fetchDWord() + '\n';
			result += '        effectstate = ' + parser.fetchDWord() + '\n';
			result += '        virtue = ' + parser.fetchDWord() + '\n';
			result += '        honor = ' + parser.fetchDWord() + '\n';
			result += '        jobpoint = ' + parser.fetchWord() + '\n';
			result += '        hp = ' + parser.fetchDWord() + '\n';
			result += '        maxhp = ' + parser.fetchDWord() + '\n';
			result += '        sp = ' + parser.fetchWord() + '\n';
			result += '        maxsp = ' + parser.fetchWord() + '\n';
			result += '        speed = ' + parser.fetchWord() + '\n';
			result += '        job = ' + getJobInfo(2) + '\n';
			result += '        head = ' + parser.fetchWord() + '\n';
			result += '        weapon = ' + parser.fetchWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        sppoint = ' + parser.fetchWord() + '\n';
			result += '        accessory = ' + parser.fetchWord() + '\n';
			result += '        shield = ' + parser.fetchWord() + '\n';
			result += '        accessory2 = ' + parser.fetchWord() + '\n';
			result += '        accessory3 = ' + parser.fetchWord() + '\n';
			result += '        headpalette = ' + parser.fetchWord() + '\n';
			result += '        bodypalette = ' + parser.fetchWord() + '\n';
			result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        Str = ' + parser.fetchByte() + '\n';
			result += '        Agi = ' + parser.fetchByte() + '\n';
			result += '        Vit = ' + parser.fetchByte() + '\n';
			result += '        Int = ' + parser.fetchByte() + '\n';
			result += '        Dex = ' + parser.fetchByte() + '\n';
			result += '        Luk = ' + parser.fetchByte() + '\n';
			result += '        CharNum = ' + parser.fetchByte() + '\n';
			result += '        haircolor = ' + parser.fetchByte() + '\n';
			result += '        bIsChangedCharName = ' + parser.fetchWord() + '\n';
			result += '        lastMap = ' + '"' + parser.fetchString(16) + '"' + '\n';
			result += '        DeleteDate = ' + parser.fetchDWord() + '\n';
			result += '        Robe = ' + parser.fetchDWord() + '\n';
			result += '        SlotAddon = ' + parser.fetchDWord() + '\n';
			result += '        RenameAddon = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x8e4
function PACKET_AC_SHUTDOWN_INFO() {
	var result = 'PACKET_AC_SHUTDOWN_INFO {\n';
	result += '    Time = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e5
function PACKET_CZ_PARTY_RECRUIT_REQ_REGISTER() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_REQ_REGISTER {\n';
	{
		var regsiterInfo = parser.remainingLength()/39;
		for (var i = 0; i < regsiterInfo; i++) {
			result += '    PARTY_RECRUIT_DETAIL regsiterInfo[' + i + '] {\n';
			result += '        Level = ' + parser.fetchWord() + '\n';
			result += '        Notice = ' + '"' + parser.fetchString(37) + '"' + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x8e6
function PACKET_ZC_PARTY_RECRUIT_ACK_REGISTER() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_ACK_REGISTER {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e7
function PACKET_CZ_PARTY_RECRUIT_REQ_SEARCH() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_REQ_SEARCH {\n';
	result += '    Level = ' + parser.fetchWord() + '\n';
	result += '    LastIndex = ' + parser.fetchDWord() + '\n';
	result += '    ResultCount = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8e9
function PACKET_CZ_PARTY_RECRUIT_REQ_DELETE() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_REQ_DELETE {\n';
	result += '}\n';
	return result;
}

//packet = 0x8ea
function PACKET_ZC_PARTY_RECRUIT_ACK_DELETE() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_ACK_DELETE {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8eb
function PACKET_CZ_PARTY_RECRUIT_REQ_UPDATE() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_REQ_UPDATE {\n';
	result += '    Notice = ' + '"' + parser.fetchString(37) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8ec
function PACKET_ZC_PARTY_RECRUIT_NOTIFY_INSERT() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_NOTIFY_INSERT {\n';
	{
		result += '    PARTY_RECRUIT_AD_INFO Info {\n';
		result += '        Index = ' + parser.fetchDWord() + '\n';
		result += '        ExpireTime = ' + parser.fetchDWord() + '\n';
		result += '        CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
		{
			result += '        PARTY_RECRUIT_DETAIL Detail {\n';
			result += '            Level = ' + parser.fetchWord() + '\n';
			result += '            Notice = ' + '"' + parser.fetchString(37) + '"' + '\n';
			result += '        }\n';
		}
		result += '    }\n';
	}
	result += '}\n';
	return result;
}

//packet = 0x8ed
function PACKET_ZC_PARTY_RECRUIT_NOTIFY_UPDATE() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_NOTIFY_UPDATE {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '    Notice = ' + '"' + parser.fetchString(37) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8ee
function PACKET_ZC_PARTY_RECRUIT_NOTIFY_DELETE() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_NOTIFY_DELETE {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8ef
function PACKET_CZ_PARTY_RECRUIT_ADD_FILTERLINGLIST() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_ADD_FILTERLINGLIST {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f0
function PACKET_CZ_PARTY_RECRUIT_SUB_FILTERLINGLIST() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_SUB_FILTERLINGLIST {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f1
function PACKET_CZ_PARTY_RECRUIT_REQ_VOLUNTEER() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_REQ_VOLUNTEER {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f2
function PACKET_ZC_PARTY_RECRUIT_VOLUNTEER_INFO() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_VOLUNTEER_INFO {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Job = ' + parser.fetchDWord() + '\n';
	result += '    Level = ' + parser.fetchWord() + '\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f4
function PACKET_CZ_PARTY_RECRUIT_SHOW_EQUIPMENT() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_SHOW_EQUIPMENT {\n';
	result += '    TargetGID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f6
function PACKET_ZC_PARTY_RECRUIT_RECALL_COST() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_RECALL_COST {\n';
	result += '    Money = ' + parser.fetchDWord() + '\n';
	result += '    mapName = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f7
function PACKET_CZ_PARTY_RECRUIT_ACK_RECALL() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_ACK_RECALL {\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f8
function PACKET_ZC_PARTY_RECRUIT_FAILED_RECALL() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_FAILED_RECALL {\n';
	result += '    CallerAID = ' + parser.fetchDWord() + '\n';
	result += '    Reason = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8f9
function PACKET_CZ_PARTY_RECRUIT_REFUSE_VOLUNTEER() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_REFUSE_VOLUNTEER {\n';
	result += '    REFUSE_AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8fa
function PACKET_ZC_PARTY_RECRUIT_REFUSE_VOLUNTEER() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_REFUSE_VOLUNTEER {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8fb
function PACKET_CZ_PARTY_RECRUIT_CANCEL_VOLUNTEER() {
	var result = 'PACKET_CZ_PARTY_RECRUIT_CANCEL_VOLUNTEER {\n';
	result += '    Index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8fc
function PACKET_CH_REQ_CHANGE_CHARACTERNAME() {
	var result = 'PACKET_CH_REQ_CHANGE_CHARACTERNAME {\n';
	result += '    dwGID = ' + parser.fetchDWord() + '\n';
	result += '    szCharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8fd
function PACKET_HC_ACK_CHANGE_CHARACTERNAME() {
	var result = 'PACKET_HC_ACK_CHANGE_CHARACTERNAME {\n';
	result += '    dwResult = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x8ff
function PACKET_ZC_EFST_SET_ENTER() {
	var result = 'PACKET_ZC_EFST_SET_ENTER {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    hEFST = ' + parser.fetchWord() + '\n';
	result += '    Time = ' + parser.fetchDWord() + '\n';
	result += '    Val1 = ' + parser.fetchDWord() + '\n';
	result += '    Val2 = ' + parser.fetchDWord() + '\n';
	result += '    Val3 = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x900
function PACKET_ZC_INVENTORY_ITEMLIST_NORMAL() {
	var result = 'PACKET_ZC_INVENTORY_ITEMLIST_NORMAL {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/22;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_NORMAL_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        Flag = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x901
function PACKET_ZC_INVENTORY_ITEMLIST_EQUIP() {
	var result = 'PACKET_ZC_INVENTORY_ITEMLIST_EQUIP {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/27;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_EQUIP_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        location = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchWord() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '        Flag = ' + parser.fetchBool() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x907
function PACKET_CZ_INVENTORY_TAB() {
	var result = 'PACKET_CZ_INVENTORY_TAB {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    NORMALorPRIVATE = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x908
function PACKET_ZC_INVENTORY_TAB() {
	var result = 'PACKET_ZC_INVENTORY_TAB {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    NORMALorPRIVATE = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x909
function PACKET_ZC_PARTY_RECRUIT_CANCEL_VOLUNTEER() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_CANCEL_VOLUNTEER {\n';
	result += '    index = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x90a
function PACKET_CZ_REQ_ENTRY_QUEUE_RANKING() {
	var result = 'PACKET_CZ_REQ_ENTRY_QUEUE_RANKING {\n';
	result += '    EntryQueueName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x90b
function PACKET_ZC_PARTY_RECRUIT_ADD_FILTERLINGLIST() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_ADD_FILTERLINGLIST {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x90c
function PACKET_ZC_PARTY_RECRUIT_SUB_FILTERLINGLIST() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_SUB_FILTERLINGLIST {\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x90d
function PACKET_ZC_PREMIUM_CAMPAIGN_INFO() {
	var result = 'PACKET_ZC_PREMIUM_CAMPAIGN_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Count = ' + parser.fetchWord() + '\n';
	result += '    PremiumValue = ' + parser.fetchDWord() + '\n';
	{
		var CampainInfo = parser.remainingLength()/14;
		for (var i = 0; i < CampainInfo; i++) {
			result += '    PREMIUM_CAMPAIGN_INFO CampainInfo[' + i + '] {\n';
			result += '        Grade = ' + parser.fetchWord() + '\n';
			result += '        Exp = ' + parser.fetchFloat() + '\n';
			result += '        Death = ' + parser.fetchFloat() + '\n';
			result += '        Drp = ' + parser.fetchFloat() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x90e
function PACKET_ZC_ENTRY_QUEUE_INIT() {
	var result = 'PACKET_ZC_ENTRY_QUEUE_INIT {\n';
	result += '}\n';
	return result;
}

//packet = 0x90f
function PACKET_ZC_NOTIFY_NEWENTRY7() {
	var result = 'PACKET_ZC_NOTIFY_NEWENTRY7 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '    maxHP = ' + parser.fetchDWord() + '\n';
	result += '    HP = ' + parser.fetchDWord() + '\n';
	result += '    isBoss = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x910
function PACKET_CZ_REQ_PARTY_NAME() {
	var result = 'PACKET_CZ_REQ_PARTY_NAME {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    PartyID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x911
function PACKET_ZC_ACK_PARTY_NAME() {
	var result = 'PACKET_ZC_ACK_PARTY_NAME {\n';
	result += '    PartyID = ' + parser.fetchDWord() + '\n';
	result += '    szPartyName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x912
function PACKET_CZ_REQ_GUILD_NAME() {
	var result = 'PACKET_CZ_REQ_GUILD_NAME {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    GuildID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x914
function PACKET_ZC_NOTIFY_MOVEENTRY9() {
	var result = 'PACKET_ZC_NOTIFY_MOVEENTRY9 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    moveStartTime = ' + parser.fetchDWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    MoveData = ' + getMove() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '    maxHP = ' + parser.fetchDWord() + '\n';
	result += '    HP = ' + parser.fetchDWord() + '\n';
	result += '    isBoss = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x915
function PACKET_ZC_NOTIFY_STANDENTRY8() {
	var result = 'PACKET_ZC_NOTIFY_STANDENTRY8 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    objecttype = ' + parser.fetchByte() + '\n';
	result += '    GID = ' + parser.fetchDWord() + '\n';
	result += '    speed = ' + parser.fetchWord() + '\n';
	result += '    bodyState = ' + parser.fetchWord() + '\n';
	result += '    healthState = ' + parser.fetchWord() + '\n';
	result += '    effectState = ' + parser.fetchDWord() + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    weapon = ' + parser.fetchDWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    headDir = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    GUID = ' + parser.fetchDWord() + '\n';
	result += '    GEmblemVer = ' + parser.fetchWord() + '\n';
	result += '    honor = ' + parser.fetchWord() + '\n';
	result += '    virtue = ' + parser.fetchDWord() + '\n';
	result += '    isPKModeON = ' + parser.fetchBool() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '    PosDir = ' + getPos() + '\n';
	result += '    xSize = ' + parser.fetchByte() + '\n';
	result += '    ySize = ' + parser.fetchByte() + '\n';
	result += '    state = ' + parser.fetchByte() + '\n';
	result += '    clevel = ' + parser.fetchWord() + '\n';
	result += '    font = ' + parser.fetchWord() + '\n';
	result += '    maxHP = ' + parser.fetchDWord() + '\n';
	result += '    HP = ' + parser.fetchDWord() + '\n';
	result += '    isBoss = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x916
function PACKET_CZ_REQ_JOIN_GUILD2() {
	var result = 'PACKET_CZ_REQ_JOIN_GUILD2 {\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x91b
function PACKET_ZC_PRNPC_STATE() {
	var result = 'PACKET_ZC_PRNPC_STATE {\n';
	result += '    Winner = ' + parser.fetchByte() + '\n';
	result += '    Point = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x91c
function PACKET_ZC_PARTY_RECRUIT_CANCEL_VOLUNTEER_TO_PM() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_CANCEL_VOLUNTEER_TO_PM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x96f
function PACKET_ZC_ACK_MERGE_ITEM() {
	var result = 'PACKET_ZC_ACK_MERGE_ITEM {\n';
	result += '    item_index = ' + parser.fetchWord() + '\n';
	result += '    item_count = ' + parser.fetchWord() + '\n';
	result += '    Result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x970
function PACKET_CH_MAKE_CHAR_NOT_STATS() {
	var result = 'PACKET_CH_MAKE_CHAR_NOT_STATS {\n';
	result += '    name = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    CharNum = ' + parser.fetchByte() + '\n';
	result += '    headPal = ' + parser.fetchWord() + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x971
function PACKET_ZC_PARTY_RECRUIT_REFUSE_VOLUNTEER_TO_PM() {
	var result = 'PACKET_ZC_PARTY_RECRUIT_REFUSE_VOLUNTEER_TO_PM {\n';
	result += '    PM_AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x973
function PACKET_ZC_WAIT_DIALOG2() {
	var result = 'PACKET_ZC_WAIT_DIALOG2 {\n';
	result += '    NAID = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x974
function PACKET_CZ_CANCEL_MERGE_ITEM() {
	var result = 'PACKET_CZ_CANCEL_MERGE_ITEM {\n';
	result += '}\n';
	return result;
}

//packet = 0x977
function PACKET_ZC_HP_INFO() {
	var result = 'PACKET_ZC_HP_INFO {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    HP = ' + parser.fetchDWord() + '\n';
	result += '    MaxHP = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x978
function PACKET_CZ_REQ_BEFORE_WORLD_INFO() {
	var result = 'PACKET_CZ_REQ_BEFORE_WORLD_INFO {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x979
function PACKET_ZC_ACK_BEFORE_WORLD_INFO() {
	var result = 'PACKET_ZC_ACK_BEFORE_WORLD_INFO {\n';
	result += '    WorldName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x97a
function PACKET_ZC_ALL_QUEST_LIST2() {
	var result = 'PACKET_ZC_ALL_QUEST_LIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    QuestCount = ' + parser.fetchDWord() + '\n';
	{
		var QuestInfo = parser.remainingLength()/15;
		for (var i = 0; i < QuestInfo; i++) {
			result += '    ALL_QUEST_LIST2_INFO QuestInfo[' + i + '] {\n';
			result += '        questID = ' + parser.fetchDWord() + '\n';
			result += '        active = ' + parser.fetchBool() + '\n';
			result += '        quest_svrTime = ' + parser.fetchDWord() + '\n';
			result += '        quest_endTime = ' + parser.fetchDWord() + '\n';
			result += '        hunting_count = ' + parser.fetchWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x97b
function PACKET_ZC_PERSONAL_INFOMATION2() {
	var result = 'PACKET_ZC_PERSONAL_INFOMATION2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Exp = ' + parser.fetchDWord() + '\n';
	result += '    Death = ' + parser.fetchDWord() + '\n';
	result += '    Drop = ' + parser.fetchDWord() + '\n';
	{
		var DatailInfo = parser.remainingLength()/13;
		for (var i = 0; i < DatailInfo; i++) {
			result += '    DETAIL_EXP_INFO DatailInfo[' + i + '] {\n';
			result += '        InfoType = ' + parser.fetchByte() + '\n';
			result += '        Exp = ' + parser.fetchDWord() + '\n';
			result += '        Death = ' + parser.fetchDWord() + '\n';
			result += '        Drop = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x97c
function PACKET_CZ_REQ_RANKING() {
	var result = 'PACKET_CZ_REQ_RANKING {\n';
	result += '    RankingType = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x97d
function PACKET_ZC_ACK_RANKING() {
	var result = 'PACKET_ZC_ACK_RANKING {\n';
	result += '    RankingType = ' + parser.fetchWord() + '\n';
	result += '    CharName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    myPoint = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x97e
function PACKET_ZC_UPDATE_RANKING_POINT() {
	var result = 'PACKET_ZC_UPDATE_RANKING_POINT {\n';
	result += '    RankingType = ' + parser.fetchWord() + '\n';
	result += '    Point = ' + parser.fetchDWord() + '\n';
	result += '    TotalPoint = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x980
function PACKET_CZ_SELECTCART() {
	var result = 'PACKET_CZ_SELECTCART {\n';
	result += '    Identity = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x981
function PACKET_ZC_PERSONAL_INFOMATION_CHN() {
	var result = 'PACKET_ZC_PERSONAL_INFOMATION_CHN {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    Exp = ' + parser.fetchWord() + '\n';
	result += '    Death = ' + parser.fetchWord() + '\n';
	result += '    Drop = ' + parser.fetchWord() + '\n';
	result += '    ActivityRate = ' + parser.fetchWord() + '\n';
	{
		var DatailInfo = parser.remainingLength()/13;
		for (var i = 0; i < DatailInfo; i++) {
			result += '    DETAIL_EXP_INFO DatailInfo[' + i + '] {\n';
			result += '        InfoType = ' + parser.fetchByte() + '\n';
			result += '        Exp = ' + parser.fetchDWord() + '\n';
			result += '        Death = ' + parser.fetchDWord() + '\n';
			result += '        Drop = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x982
function PACKET_ZC_FATIGUE_CHN() {
	var result = 'PACKET_ZC_FATIGUE_CHN {\n';
	result += '    Level = ' + parser.fetchByte() + '\n';
	result += '    TotalPlayTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x983
function PACKET_ZC_MSG_STATE_CHANGE3() {
	var result = 'PACKET_ZC_MSG_STATE_CHANGE3 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    state = ' + parser.fetchBool() + '\n';
	result += '    MaxMS = ' + parser.fetchDWord() + '\n';
	result += '    RemainMS = ' + parser.fetchDWord() + '\n';
	result += '    val = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x984
function PACKET_ZC_EFST_SET_ENTER2() {
	var result = 'PACKET_ZC_EFST_SET_ENTER2 {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    hEFST = ' + parser.fetchWord() + '\n';
	result += '    MaxMS = ' + parser.fetchDWord() + '\n';
	result += '    Time = ' + parser.fetchDWord() + '\n';
	result += '    Val1 = ' + parser.fetchDWord() + '\n';
	result += '    Val2 = ' + parser.fetchDWord() + '\n';
	result += '    Val3 = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x985
function PACKET_ZC_SKILL_POSTDELAY_LIST2() {
	var result = 'PACKET_ZC_SKILL_POSTDELAY_LIST2 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var PostDelay = parser.remainingLength()/10;
		for (var i = 0; i < PostDelay; i++) {
			result += '    tagSkillPostDelay PostDelay[' + i + '] {\n';
			result += '        SKID = ' + getSkillInfo() + '\n';
			result += '        MaxDelayTM = ' + parser.fetchDWord() + '\n';
			result += '        DelayTM = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x986
function PACKET_AC_SHUTDOWN_NOTIFY() {
	var result = 'PACKET_AC_SHUTDOWN_NOTIFY {\n';
	result += '    Time = ' + parser.fetchDWord() + '\n';
	result += '    ServerTime = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x987
function PACKET_CA_LOGIN6() {
	var result = 'PACKET_CA_LOGIN6 {\n';
	result += '    Version = ' + parser.fetchDWord() + '\n';
	result += '    ID = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    PasswdMD5 = ' + '"' + parser.fetchString(32) + '"' + '\n';
	result += '    clienttype = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x988
function PACKET_ZC_NOTIFY_CLAN_CONNECTINFO() {
	var result = 'PACKET_ZC_NOTIFY_CLAN_CONNECTINFO {\n';
	result += '    NumConnect = ' + parser.fetchWord() + '\n';
	result += '    NumTotal = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x989
function PACKET_ZC_ACK_CLAN_LEAVE() {
	var result = 'PACKET_ZC_ACK_CLAN_LEAVE {\n';
	result += '}\n';
	return result;
}

//packet = 0x98a
function PACKET_ZC_CLANINFO() {
	var result = 'PACKET_ZC_CLANINFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    EmblemNum = ' + parser.fetchDWord() + '\n';
	result += '    ClanName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    Mastername = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    ManageMap = ' + '"' + parser.fetchString(16) + '"' + '\n';
	result += '    Num_AllyClan = ' + parser.fetchByte() + '\n';
	result += '    Num_HostileClan = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x98b
function PACKET_AC_REQ_NEW_USER() {
	var result = 'PACKET_AC_REQ_NEW_USER {\n';
	result += '}\n';
	return result;
}

//packet = 0x98c
function PACKET_CA_ACK_NEW_USER() {
	var result = 'PACKET_CA_ACK_NEW_USER {\n';
	result += '    Sex = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x98d
function PACKET_CZ_CLAN_CHAT() {
	var result = 'PACKET_CZ_CLAN_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    chat = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x98e
function PACKET_ZC_NOTIFY_CLAN_CHAT() {
	var result = 'PACKET_ZC_NOTIFY_CLAN_CHAT {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    charName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    chat = ' + '"' + parser.fetchString(-1) + '"' + '\n';
	result += '}\n';
	return result;
}

//packet = 0x990
function PACKET_ZC_ITEM_PICKUP_ACK_V5() {
	var result = 'PACKET_ZC_ITEM_PICKUP_ACK_V5 {\n';
	result += '    Index = ' + parser.fetchWord() + '\n';
	result += '    count = ' + parser.fetchWord() + '\n';
	result += '    ITID = ' + getItemInfo() + '\n';
	result += '    IsIdentified = ' + parser.fetchBool() + '\n';
	result += '    IsDamaged = ' + parser.fetchBool() + '\n';
	result += '    refiningLevel = ' + parser.fetchByte() + '\n';
	{
		result += '    EQUIPSLOTINFO slot {\n';
		result += '        card1 = ' + getItemInfo() + '\n';
		result += '        card2 = ' + getItemInfo() + '\n';
		result += '        card3 = ' + getItemInfo() + '\n';
		result += '        card4 = ' + getItemInfo() + '\n';
		result += '    }\n';
	}
	result += '    location = ' + parser.fetchDWord() + '\n';
	result += '    type = ' + parser.fetchByte() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '    HireExpireDate = ' + parser.fetchDWord() + '\n';
	result += '    bindOnEquipType = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x991
function PACKET_ZC_INVENTORY_ITEMLIST_NORMAL_V5() {
	var result = 'PACKET_ZC_INVENTORY_ITEMLIST_NORMAL_V5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/24;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_NORMAL_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchDWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        Flag = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x992
function PACKET_ZC_INVENTORY_ITEMLIST_EQUIP_V5() {
	var result = 'PACKET_ZC_INVENTORY_ITEMLIST_EQUIP_V5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/31;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_EQUIP_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        location = ' + parser.fetchDWord() + '\n';
			result += '        WearState = ' + parser.fetchDWord() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '        Flag = ' + parser.fetchBool() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x993
function PACKET_ZC_CART_ITEMLIST_NORMAL_V5() {
	var result = 'PACKET_ZC_CART_ITEMLIST_NORMAL_V5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/24;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_NORMAL_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchDWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        Flag = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x994
function PACKET_ZC_CART_ITEMLIST_EQUIP_V5() {
	var result = 'PACKET_ZC_CART_ITEMLIST_EQUIP_V5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/31;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_EQUIP_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        location = ' + parser.fetchDWord() + '\n';
			result += '        WearState = ' + parser.fetchDWord() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '        Flag = ' + parser.fetchBool() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x995
function PACKET_ZC_STORE_ITEMLIST_NORMAL_V5() {
	var result = 'PACKET_ZC_STORE_ITEMLIST_NORMAL_V5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/24;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_NORMAL_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        count = ' + parser.fetchWord() + '\n';
			result += '        WearState = ' + parser.fetchDWord() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        Flag = ' + parser.fetchByte() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x996
function PACKET_ZC_STORE_ITEMLIST_EQUIP_V5() {
	var result = 'PACKET_ZC_STORE_ITEMLIST_EQUIP_V5 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var Items = parser.remainingLength()/27;
		for (var i = 0; i < Items; i++) {
			result += '    ITEMLIST_EQUIP_ITEM Items[' + i + '] {\n';
			result += '        index = ' + parser.fetchWord() + '\n';
			result += '        ITID = ' + getItemInfo() + '\n';
			result += '        type = ' + parser.fetchByte() + '\n';
			result += '        location = ' + parser.fetchDWord() + '\n';
			result += '        WearState = ' + parser.fetchDWord() + '\n';
			result += '        RefiningLevel = ' + parser.fetchByte() + '\n';
			{
				result += '        EQUIPSLOTINFO slot {\n';
				result += '            card1 = ' + getItemInfo() + '\n';
				result += '            card2 = ' + getItemInfo() + '\n';
				result += '            card3 = ' + getItemInfo() + '\n';
				result += '            card4 = ' + getItemInfo() + '\n';
				result += '        }\n';
			}
			result += '        HireExpireDate = ' + parser.fetchDWord() + '\n';
			result += '        bindOnEquipType = ' + parser.fetchWord() + '\n';
			result += '        wItemSpriteNumber = ' + parser.fetchWord() + '\n';
			result += '        Flag = ' + parser.fetchBool() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x997
function PACKET_ZC_EQUIPWIN_MICROSCOPE_V5() {
	var result = 'PACKET_ZC_EQUIPWIN_MICROSCOPE_V5 {\n';
	result += '    Length = ' + parser.fetchWord() + '\n';
	result += '    characterName = ' + '"' + parser.fetchString(24) + '"' + '\n';
	result += '    job = ' + getJobInfo(2) + '\n';
	result += '    head = ' + parser.fetchWord() + '\n';
	result += '    accessory = ' + parser.fetchWord() + '\n';
	result += '    accessory2 = ' + parser.fetchWord() + '\n';
	result += '    accessory3 = ' + parser.fetchWord() + '\n';
	result += '    robe = ' + parser.fetchWord() + '\n';
	result += '    headpalette = ' + parser.fetchWord() + '\n';
	result += '    bodypalette = ' + parser.fetchWord() + '\n';
	result += '    sex = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x998
function PACKET_CZ_REQ_WEAR_EQUIP_V5() {
	var result = 'PACKET_CZ_REQ_WEAR_EQUIP_V5 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x999
function PACKET_ZC_ACK_WEAR_EQUIP_V5() {
	var result = 'PACKET_ZC_ACK_WEAR_EQUIP_V5 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchDWord() + '\n';
	result += '    wItemSpriteNumber = ' + parser.fetchWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x99a
function PACKET_ZC_ACK_TAKEOFF_EQUIP_V5() {
	var result = 'PACKET_ZC_ACK_TAKEOFF_EQUIP_V5 {\n';
	result += '    index = ' + parser.fetchWord() + '\n';
	result += '    wearLocation = ' + parser.fetchDWord() + '\n';
	result += '    result = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x99b
function PACKET_ZC_MAPPROPERTY_R2() {
	var result = 'PACKET_ZC_MAPPROPERTY_R2 {\n';
	result += '    type = ' + parser.fetchWord() + '\n';
	result += '    NotifyPropertyBits = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x99c
function PACKET_CH_REQ_CHARINFO_PER_PAGE() {
	var result = 'PACKET_CH_REQ_CHARINFO_PER_PAGE {\n';
	result += '    SeqNum = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x99d
function PACKET_HC_ACK_CHARINFO_PER_PAGE() {
	var result = 'PACKET_HC_ACK_CHARINFO_PER_PAGE {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	{
		var charInfo = parser.remainingLength()/144;
		for (var i = 0; i < charInfo; i++) {
			result += '    CHARACTER_INFO_NEO_UNION charInfo[' + i + '] {\n';
			result += '        GID = ' + parser.fetchDWord() + '\n';
			result += '        exp = ' + parser.fetchDWord() + '\n';
			result += '        money = ' + parser.fetchDWord() + '\n';
			result += '        jobexp = ' + parser.fetchDWord() + '\n';
			result += '        joblevel = ' + parser.fetchDWord() + '\n';
			result += '        bodystate = ' + parser.fetchDWord() + '\n';
			result += '        healthstate = ' + parser.fetchDWord() + '\n';
			result += '        effectstate = ' + parser.fetchDWord() + '\n';
			result += '        virtue = ' + parser.fetchDWord() + '\n';
			result += '        honor = ' + parser.fetchDWord() + '\n';
			result += '        jobpoint = ' + parser.fetchWord() + '\n';
			result += '        hp = ' + parser.fetchDWord() + '\n';
			result += '        maxhp = ' + parser.fetchDWord() + '\n';
			result += '        sp = ' + parser.fetchWord() + '\n';
			result += '        maxsp = ' + parser.fetchWord() + '\n';
			result += '        speed = ' + parser.fetchWord() + '\n';
			result += '        job = ' + getJobInfo(2) + '\n';
			result += '        head = ' + parser.fetchWord() + '\n';
			result += '        weapon = ' + parser.fetchWord() + '\n';
			result += '        level = ' + parser.fetchWord() + '\n';
			result += '        sppoint = ' + parser.fetchWord() + '\n';
			result += '        accessory = ' + parser.fetchWord() + '\n';
			result += '        shield = ' + parser.fetchWord() + '\n';
			result += '        accessory2 = ' + parser.fetchWord() + '\n';
			result += '        accessory3 = ' + parser.fetchWord() + '\n';
			result += '        headpalette = ' + parser.fetchWord() + '\n';
			result += '        bodypalette = ' + parser.fetchWord() + '\n';
			result += '        name = ' + '"' + parser.fetchString(24) + '"' + '\n';
			result += '        Str = ' + parser.fetchByte() + '\n';
			result += '        Agi = ' + parser.fetchByte() + '\n';
			result += '        Vit = ' + parser.fetchByte() + '\n';
			result += '        Int = ' + parser.fetchByte() + '\n';
			result += '        Dex = ' + parser.fetchByte() + '\n';
			result += '        Luk = ' + parser.fetchByte() + '\n';
			result += '        CharNum = ' + parser.fetchByte() + '\n';
			result += '        haircolor = ' + parser.fetchByte() + '\n';
			result += '        bIsChangedCharName = ' + parser.fetchWord() + '\n';
			result += '        lastMap = ' + '"' + parser.fetchString(16) + '"' + '\n';
			result += '        DeleteDate = ' + parser.fetchDWord() + '\n';
			result += '        Robe = ' + parser.fetchDWord() + '\n';
			result += '        SlotAddon = ' + parser.fetchDWord() + '\n';
			result += '        RenameAddon = ' + parser.fetchDWord() + '\n';
			result += '    }\n';
		}
	}
	result += '}\n';
	return result;
}

//packet = 0x99e
function PACKET_HC_QUEUE_ORDER() {
	var result = 'PACKET_HC_QUEUE_ORDER {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    m_AID = ' + parser.fetchDWord() + '\n';
	result += '    m_QueueOrder = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x99f
function PACKET_ZC_SKILL_ENTRY4() {
	var result = 'PACKET_ZC_SKILL_ENTRY4 {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    creatorAID = ' + parser.fetchDWord() + '\n';
	result += '    xPos = ' + parser.fetchWord() + '\n';
	result += '    yPos = ' + parser.fetchWord() + '\n';
	result += '    job = ' + parser.fetchDWord() + '\n';
	result += '    RadiusRange = ' + parser.fetchByte() + '\n';
	result += '    isVisible = ' + parser.fetchBool() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a0
function PACKET_HC_CHARLIST_NOTIFY() {
	var result = 'PACKET_HC_CHARLIST_NOTIFY {\n';
	result += '    TotalCnt = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a1
function PACKET_CH_CHARLIST_REQ() {
	var result = 'PACKET_CH_CHARLIST_REQ {\n';
	result += '}\n';
	return result;
}

//packet = 0x9a2
function PACKET_AC_REQ_MOBILE_OTP() {
	var result = 'PACKET_AC_REQ_MOBILE_OTP {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a4
function PACKET_ZC_DISPATCH_TIMING_INFO_CHN() {
	var result = 'PACKET_ZC_DISPATCH_TIMING_INFO_CHN {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Balance = ' + parser.fetchDWord() + '\n';
	result += '    Effective_dTime = ' + parser.fetchDWord() + '\n';
	result += '    Reason = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a5
function PACKET_AC_REFUSE_LOGIN3() {
	var result = 'PACKET_AC_REFUSE_LOGIN3 {\n';
	result += '    ErrorCode = ' + parser.fetchByte() + '\n';
	result += '    BlockedReaminSEC = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a6
function PACKET_ZC_BANKING_CHECK() {
	var result = 'PACKET_ZC_BANKING_CHECK {\n';
	result += '    Money = ' + parser.fetchQWord() + '\n';
	result += '    Reason = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a7
function PACKET_CZ_REQ_BANKING_DEPOSIT() {
	var result = 'PACKET_CZ_REQ_BANKING_DEPOSIT {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Money = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a8
function PACKET_ZC_ACK_BANKING_DEPOSIT() {
	var result = 'PACKET_ZC_ACK_BANKING_DEPOSIT {\n';
	result += '    Reason = ' + parser.fetchWord() + '\n';
	result += '    Money = ' + parser.fetchQWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9a9
function PACKET_CZ_REQ_BANKING_WITHDRAW() {
	var result = 'PACKET_CZ_REQ_BANKING_WITHDRAW {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    Money = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9aa
function PACKET_ZC_ACK_BANKING_WITHDRAW() {
	var result = 'PACKET_ZC_ACK_BANKING_WITHDRAW {\n';
	result += '    Reason = ' + parser.fetchWord() + '\n';
	result += '    Money = ' + parser.fetchQWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9ab
function PACKET_CZ_REQ_BANKING_CHECK() {
	var result = 'PACKET_CZ_REQ_BANKING_CHECK {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9ac
function PACKET_CZ_REQ_CASH_BARGAIN_SALE_ITEM_INFO() {
	var result = 'PACKET_CZ_REQ_CASH_BARGAIN_SALE_ITEM_INFO {\n';
	result += '    PacketLength = ' + parser.fetchWord() + '\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9ad
function PACKET_ZC_ACK_CASH_BARGAIN_SALE_ITEM_INFO() {
	var result = 'PACKET_ZC_ACK_CASH_BARGAIN_SALE_ITEM_INFO {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '    ItemID = ' + parser.fetchWord() + '\n';
	result += '    Price = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9ae
function PACKET_CZ_REQ_APPLY_BARGAIN_SALE_ITEM() {
	var result = 'PACKET_CZ_REQ_APPLY_BARGAIN_SALE_ITEM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    ItemID = ' + parser.fetchWord() + '\n';
	result += '    Count = ' + parser.fetchDWord() + '\n';
	result += '    StartDate = ' + parser.fetchDWord() + '\n';
	result += '    SellingTime = ' + parser.fetchByte() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9af
function PACKET_ZC_ACK_APPLY_BARGAIN_SALE_ITEM() {
	var result = 'PACKET_ZC_ACK_APPLY_BARGAIN_SALE_ITEM {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b0
function PACKET_CZ_REQ_REMOVE_BARGAIN_SALE_ITEM() {
	var result = 'PACKET_CZ_REQ_REMOVE_BARGAIN_SALE_ITEM {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '    ItemID = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b1
function PACKET_ZC_ACK_REMOVE_BARGAIN_SALE_ITEM() {
	var result = 'PACKET_ZC_ACK_REMOVE_BARGAIN_SALE_ITEM {\n';
	result += '    Result = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b2
function PACKET_ZC_NOTIFY_BARGAIN_SALE_SELLING() {
	var result = 'PACKET_ZC_NOTIFY_BARGAIN_SALE_SELLING {\n';
	result += '    ItemID = ' + parser.fetchWord() + '\n';
	result += '    TabCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b3
function PACKET_ZC_NOTIFY_BARGAIN_SALE_CLOSE() {
	var result = 'PACKET_ZC_NOTIFY_BARGAIN_SALE_CLOSE {\n';
	result += '    ItemID = ' + parser.fetchWord() + '\n';
	result += '    TabCode = ' + parser.fetchWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b4
function PACKET_CZ_OPEN_BARGAIN_SALE_TOOL() {
	var result = 'PACKET_CZ_OPEN_BARGAIN_SALE_TOOL {\n';
	result += '    AID = ' + parser.fetchDWord() + '\n';
	result += '}\n';
	return result;
}

//packet = 0x9b5
function PACKET_ZC_OPEN_BARGAIN_SALE_TOOL() {
	var result = 'PACKET_ZC_OPEN_BARGAIN_SALE_TOOL {\n';
	result += '}\n';
	return result;
}
