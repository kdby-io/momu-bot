module.exports = (robot) ->

  robot.hear /hhkb|해피해킹/i, (msg) ->
    msg.http("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%3D%22JPYKRW%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
      .get() (err, res, body) ->
        if err
          res.send "Encountered an error :( #{err}"
          return
        if res.statusCode isnt 200
          res.send "Request didn't come back HTTP 200 :("
          return

        try
          data = JSON.parse body
          rate = (data.query.results.rate.Rate*100).toFixed(2)
          YEN_PRICE = 29700
          WON_PRICE = YEN_PRICE*rate/100
          msg.send "현재 #{rate}의 JPY100/KRW 환율로 `#{WON_PRICE.toFixed(0)}`원에 HHKB BT를 절찬리 판매중!"

        catch error
          res.send "Ran into an error parsing JSON :("
          return
