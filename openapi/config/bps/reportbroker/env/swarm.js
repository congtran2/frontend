/**
 * Development environment settings
 *
 * This file can include shared settings for a development team,
 * such as API keys or remote database passwords.  If you're using
 * a version control solution for your Sails app, this file will
 * be committed to your repository unless you add it to your .gitignore
 * file.  If your repository will be publicly viewable, don't add
 * any private information to this file!
 *
 */

module.exports = {

    /***************************************************************************
     * Set the default database connection for models in the development       *
     * environment (see config/connections.js and config/models.js )           *
     ***************************************************************************/

    // models: {
    //   connection: 'someMongodbServer'
    // }

    port: process.env.BASEREPORT_PORT || 13332,
    OracleDBServer: {
        user: `${process.env.BPS_REPORT_USER}`,
        password: `${process.env.BPS_REPORT_PASSWORD}`,
        connectString: `${process.env.BPS_REPORT_CONNECT_STRING}`,
        _enableStats: true,
        fetchArraySize: 1000,
        stmtCacheSize: 100,
        maxRows: 1000,
        poolMax: 10,
        poolMin: 2,
        poolIncrement: 1,
        poolTimeout: 60,
        queueTimeout: 5000,
        poolPingInterval: 30,
    },
};
