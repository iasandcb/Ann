# 서버

    Market.MAIN = METHOD(
        run: (m, params) ->
            Market.CompanyModel()
            Market.ServiceModel()
            Market.CommentModel()
            jn = require 'jasmine-node'
            Market.REQUEST 'test', (method, params, paramStr, headers, response, serveErrorPage) ->
                jn.run
                    specFolders:['Market/spec']
                    watchFolders: []
                    coffee: true
                    extensions: 'litcoffee'

                response
                    content: 'ok'
                    contentType : 'text/plain'
                    encoding : 'utf-8'
                return
            return
    )
