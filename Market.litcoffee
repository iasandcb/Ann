# AM

    require "./COFFEESITE/BOOT.coffee"

    BOOT
        CONFIG:
            defaultBoxName: "Market"
            isDevMode: true
            isMobileFullScreen: true

        NODE_CONFIG:
            isNotRequiringDBAuth: true
            dbName: 'ann'
