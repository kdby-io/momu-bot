module.exports = (robot) ->

  DAY = 1000*60*60*24
  firstDay = new Date('02/25/2013')
  today = new Date
  lastDay = new Date('02/25/2018')

  totalDay = Math.round((lastDay.getTime() - firstDay.getTime())/DAY)
  remainingDay = Math.round((lastDay.getTime() - today.getTime())/DAY)

  robot.hear /닭|치킨|대통령|박근혜|ㄹ혜|ㄹㅎ/i, (msg) ->
    rate = 100 - (Math.round(remainingDay/totalDay*100 * 100) / 100)
    cellCount = Math.round(rate*2/10)
    blackCell = "■"
    whiteCell = "□"
    cell = blackCell.repeat(cellCount) + whiteCell.repeat(20-cellCount)
    msg.send "퇴임 로딩중... [#{cell}] #{rate}% - 남은 날짜: #{remainingDay}일"
