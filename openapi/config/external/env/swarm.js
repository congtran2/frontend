module.exports = {
    port: process.env.EXTERNAL_PORT || 1330,
    serviceConnections: {
        SOAP_TIMEOUT: 60 * 1000,
        MServerService: {
            name: 'MServerService',
            serviceUrl: `${process.env.MSERVER_ENDPOINT}/MServerGate/cxf/TokenValidationWS`,
            envelope: [],
            actions: {
                getTokenProfile: {
                    name: 'getTokenProfile',
                    httpHeaders: [],
                },
                initValidation: {
                    name: 'initValidation',
                    httpHeaders: [],
                },
                doValidateToken: {
                    name: 'doValidateToken',
                    httpHeaders: [],
                },
            }
        },
        HostService: {
            name: 'HostService',
            serviceUrl: `${process.env.HOST_SERVICE_URL}`,        // Địa chỉ Host service
            actions: {
                MessageString: {
                    name: 'MessageString',
                    namespace: 'http://tempuri.org/',
                    soapHeader: {
                        'wsa:To': `${process.env.HOST_SERVICE_URL}`,   // Địa chỉ Host service
                        'wsa:Action': 'http://tempuri.org/IHOSTService/MessageString'
                    }
                }
            }
        },
        BankGatewayService: {
            SOAP_TIMEOUT: 60 * 1000,
            name: 'BankGatewayService',
            serviceUrl: `${process.env.BANK_SERVICE_URL}`,       //địa chỉ bank service
            actions: {
                ExecuteMessage: {
                    name: 'ExecuteMessage',
                    namespace: 'http://tempuri.org/',
                    soapHeader: {
                        'wsa:To': `${process.env.BANK_SERVICE_URL}`, //địa chỉ bank service
                        'wsa:Action': 'http://tempuri.org/ExecuteMessage'
                    }
                }
            }
        },
        SignService: {
            name: 'SignService',
            serviceUrl: `${process.env.SIGNSERVER_URL}`,
            envelope: [],
            actions: {
                doVerify: {
                    name: 'doVerify',
                    httpHeaders: []
                }
            }
        },
        TokenService: {
            SOAP_TIMEOUT: 60 * 1000,
            name: 'TokenService',
            serviceUrl: `${process.env.TOKENSERVICE_URL}`,
            envelope: [
                "xmlns:tem=\"http://tempuri.org/\"",
            ],
            actions: {
                getTokenProfile: {
                    name: 'getTokenProfile',
                    httpHeaders: {
                        'Content-Type': 'text/xml',
                        'SOAPAction': 'http://tempuri.org/IServiceEntrust/getTokenProfile',
                    },
                },
                initValidation: {
                    name: 'initValidation',
                    httpHeaders: {
                        'Content-Type': 'text/xml',
                        'SOAPAction': 'http://tempuri.org/IServiceEntrust/initValidation',
                    },
                },
                doValidateToken: {
                    name: 'doValidateToken',
                    httpHeaders: {
                        'Content-Type': 'text/xml',
                        'SOAPAction': 'http://tempuri.org/IServiceEntrust/doValidateToken',
                    },
                },
            },
        },
    },
};