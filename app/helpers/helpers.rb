def last_asked(time)
  hours = ((Time.now - time)/3600).round
  minutes = ((Time.now - time)/60).round

  if hours > 24
    return "asked: #{(hours/24).round} day(s) ago"
  end

  if minutes < 1
    return "asked: 12 seconds ago"
  elsif minutes >=60
    return "asked: #{hours} hour(s) ago"
  else
    return "asked: #{minutes} minute(s) ago"
  end
end


def last_time(time)
  hours = ((Time.now - time)/3600).round
  minutes = ((Time.now - time)/60).round

  if hours > 24
    return "#{(hours/24).round} day(s) ago"
  end

  if minutes < 1
    return "#{(minutes*60).round} seconds ago"
  elsif minutes >=60
    return "#{hours} hour(s) ago"
  else
    return "#{minutes} minute(s) ago"
  end
end
