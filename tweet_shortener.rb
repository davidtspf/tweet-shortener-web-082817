require "pry"

def dictionary
  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet_string)
  bit_by_bit = tweet_string.split
  bit_by_bit.collect do |word|
    if dictionary.keys.include?(word.downcase)
      word = dictionary[word.downcase]
    else
      word
    end
  end.join(" ")
end

def bulk_tweet_shortener(tweets_array)
  tweets_array.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet_string)
  if tweet_string.length > 140
    word_substituter(tweet_string)
  else
    return tweet_string
  end
end

def shortened_tweet_truncator(tweet_string)
  if selective_tweet_shortener(tweet_string).length > 140
    tweet_string[0..136] + "..."
  else
    selective_tweet_shortener(tweet_string)
  end
end
