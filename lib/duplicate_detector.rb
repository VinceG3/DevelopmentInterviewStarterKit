module DuplicateDetector
  # uses levenshtein distance algorithm to calculate edit distance.
  # RFC 5321 says that the domain part of emails are case insensitive
  # while the username part should be treated as case sensitive.
  # Kind of a mess. I would assume emails get their own model in a real
  # application. So if we have a list of email addresses that are going
  # to get hydrated into model instances, a dupe detector would be a very
  # useful tool. For this method, I am not going to downcase the whole
  # string for the purpose of calculating the levenshtein distance,
  # instead I'm going to treat the mailbox part separately from the domain
  # part. But my intuition is that typos are more likely to affect the
  # mailbox part more often than the domain part. So the domain will be
  # case insensitive, but errors will be weighted more heavily by the algorithm.
  # While errors in the mailbox portion are to be expected and will do more
  # to trip the dupe detector. After some testing, I've set the threshold
  # at 3.  

  # Other things that might need to be considered in a production solution
  # are Unicode / Microsoft encoding issues in case they're copying from
  # Microsoft Word or auto-Unicode formatting websites. Assuming these aren't
  # caught in the ingestion process, of course.

  THRESHOLD = 4
  DOMAIN_WEIGHT = 1.5

  def self.score_list(array_of_emails)
    combinations = array_of_emails.combination(2).to_a
    scores = {}
    combinations.each do |pair|
      scores[pair] = score_pair(*pair)
    end
    scores = scores.delete_if{|k,v| v > THRESHOLD }
    return scores.keys
  end

  def self.score_pair(email1, email2)
    mailbox1, domain1 = email1.split '@'
    mailbox2, domain2 = email2.split '@'
    domain1.downcase!; domain2.downcase!
    mailbox_score = levenshtein_calc(mailbox1, mailbox2)
    domain_score = levenshtein_calc(domain1, domain2) * DOMAIN_WEIGHT
    return mailbox_score + domain_score
  end

  def self.levenshtein_calc(string1, string2)
    n = string1.length
    m = string2.length
    max = n / 2
   
    return m if 0 == n
    return n if 0 == m
    return n if (n - m).abs > max
   
    d = (0..m).to_a
    x = nil
   
    string1.each_char.with_index do |char1,i|
      e = i + 1
   
      string2.each_char.with_index do |char2,j|
        cost = (char1 == char2) ? 0 : 1
        x = [ d[j + 1] + 1,  # insertion
              e + 1,         # deletion
              d[j] + cost    # substitution
            ].min
        d[j] = e
        e = x
      end
   
      d[m] = x
    end
   
    return x
  end
end