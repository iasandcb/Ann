# AM

    require "#{process.env['UPPERCASE_IO_PATH']}/BOOT"

    BOOT
        CONFIG:
            defaultBoxName: "Market"
            isDevMode: true
            webServerPort: 8889
            webSocketServerPort: 8890
            webSocketFixServerPort: 8891

        NODE_CONFIG:
            dbName: 'ann'
