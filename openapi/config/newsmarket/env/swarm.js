/**
 * Production environment settings
 * (sails.config.*)
 *
 * What you see below is a quick outline of the built-in settings you need
 * to configure your Sails app for production.  The configuration in this file
 * is only used in your production environment, i.e. when you lift your app using:
 *
 * ```
 * NODE_ENV=production node app
 * ```
 *
 * > If you're using git as a version control solution for your Sails app,
 * > this file WILL BE COMMITTED to your repository by default, unless you add
 * > it to your .gitignore file.  If your repository will be publicly viewable,
 * > don't add private/sensitive data (like API secrets / db passwords) to this file!
 *
 * For more best practices and tips, see:
 * https://sailsjs.com/docs/concepts/deployment
 */
module.exports = {
    port: 1346,
    serviceConnections: {
        NewsService: {
            name: 'NewsService',
            serviceUrl: `${process.env.IDSERVICE_URL}`,
            envelope: [],
            actions: {
                GetNewsInfo: {
                    name: 'GetNewsInfo',
                    httpHeaders: {
                        'Content-Type': 'application/soap+xml; charset=utf-8',
                        'SOAPAction': 'http://tempuri.org/IDataService/GetNewsInfo'
                    },
                    soapHeader: {
                        'wsa:Action': 'http://tempuri.org/IDataService/GetNewsInfo',
                        'wsa:To': `${process.env.IDSERVICE_URL}`,
                    }
                }
            }
        }
    }    
};