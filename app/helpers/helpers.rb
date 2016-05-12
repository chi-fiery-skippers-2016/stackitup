def last_asked(time)
  hours = ((Time.now - time)/3600).round
  minutes = ((Time.now - time)/60).round
  
  if hours > 24
    (hours/24).round
  end
  
  if minutes < 1 #days
    (minutes*60).round #econds
  else
    minutes
  end
end
