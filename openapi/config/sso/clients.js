module.exports = {
	clients: [
		// {
		//     "name": "TradingDev",                        // Tên client
		//     "redirectURI": "http://localhost:3000/sso",  // url callback của client
		//     "trusted": true,                             // Nếu client do mình tự phát triển thì trusted = true
		//     "active": true,                              // Nếu client hoạt động thì active = true
		//     "clientId": "FZKD31RTMO",                    // ClientId: 10 ký tự random trong [A-Z0-9]
		//     "clientSecret": "AiscAPP9jgSZ9bMjxlkDQypW3I8tEP",    // ClientSecret: 30 ký tự random trong [a-zA-Z0-9]
		// },
		{
			"name": "Mobile",
			"redirectURI": "Mobile",
            "clientId": "MOBILE", 
            "clientSecret": "MOBILE",
			"via": "M",
			"trusted": true,
			"active": true,
			"enableBroker": true,
		},
		{
            "name": "Online",
            "redirectURI": "http://10.111.109.64/fs2pro/sso",
            "clientId": "HZ4UAE61G3",
            "clientSecret": "hRMjJIuLgumLADHLDakVI88zrZYq9D",
            "via": 'O',
            "trusted": true,
            "active": true,
            "enableBroker": true,
        },
        {
            "name": "Mobile",
            "redirectURI": "Mobile",
            "clientId": "2OGMFCR6D8",
            "clientSecret": "JZXNtYkAEXhBPRH6X6act3l0KSu7tG",
            "via": 'C',
            "trusted": true,
            "active": true,
            "enableBroker": true,
        },
        {
            "name": "Iboard Local",
            "redirectURI": "http://localhost:8125/iboard/callback",
            "clientId": "2M5F857Y3Z",
            "clientSecret": "BFPiKnTZEPixAyXjU73wwQFT3Nv8zj",
            "via": 'B',
            "trusted": true,
            "active": true,
            "enableBroker": true,
        },
        
	]
};
