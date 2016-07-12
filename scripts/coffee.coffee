module.exports = (robot) ->

    coffees = ['에스프레소', '아메리카노', '카페라떼', '카페모카', '카푸치노', '카라멜 마키야또', '프라푸치노']
    notCoffees = ['생과일 주스', '녹차라떼', '홍차라떼', '핫초코']
    beverages = coffees.concat(notCoffees)

    robot.respond /커피|카페/i, (msg) ->
        drink = msg.random beverages
        robot.logger.error coffees.indexOf drink
        if (coffees.indexOf drink) >= 0
            msg.reply "오늘 행운의 커피는 *#{drink}* 입니다. 믿고 마셔봐!"
        else
            msg.reply "오늘은 커피 대신 *#{drink}* 어때? 믿고 마셔봐!"
