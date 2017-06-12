#life calculator
def years_alive(birthday)
  #days in the months array
  days_in_months=[31,28,31,30,31,30,31,31,30,31,30,31]
  
  #current date 
  the_time=Time.now.to_s.split(" ")
  date=the_time[0].split("-")
 
  #save each part of the date as a separate variable
  year=date[0].to_f
  month=date[1].to_f
  day=date[2].to_f
 
  #person's date
  user_date=birthday.split("/")
  user_year=user_date[2].to_f
  user_month=user_date[0].to_f
  user_day=user_date[1].to_f

  #additional days to years_age(years_age is expressed in days)
  i=0 #counter
  extra_days=0
  days_in_months.each do |days|
  i+=1
     if i < month
        extra_days+=days
     end
  end
  
  #people who haven't had their birthday yet this year
  if user_month > month || (user_month==month && user_day > day)
    years_age = (year - user_year - 1)*365
    k=0
    more_days=0
    days_in_months.each do |days|
      k+=1
      if k > user_month
        more_days+=days
      end
    end
    days_age = extra_days+day+more_days+days_in_months[user_month-1]-user_day
  #people who have had their birthday this year
  else 
    years_age=(year - user_year)*365
    j=0
    less_days=0
    subtract_days=days_in_months.each do |month|
      j+=1
      if user_month > j 
        less_days+=month
      end
    end
    days_age=extra_days+day-less_days-user_day
    puts days_age
  end
 #factoring in leap years
 leap_years=((years_age/4)/365).floor
  #total of everything
 return days_age+years_age+leap_years
end



def klossify(phrase)
  phrase.gsub("c","k").gsub("C","K")
end


 def piglatinize(word)
    non_pig_latin_words = ["i", "me", "to", "too", "a", "an", "in", "and", "on"]
    vowels = ["a", "e", "i", "o", "u"]
 
      if non_pig_latin_words.include?(word)
        word
       elsif vowels.include? word[0]
        word << "ay"
       else
         consonants = ""
       while !vowels.include?(word[0])
         consonants << word[0]
         word = word.split("")[1..-1].join
       end
       word + consonants + 'ay'
   end
 end
 
#call to_pig_latin in the application controller
 def to_pig_latin(string)
   string.split.collect{|word| piglatinize(word)}.join(" ")
 end