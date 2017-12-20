module HomeHelper
  def issue_rating(count)
    return 0 if count.empty?
    return 5 if count['critical'] > 1
    return 4 if count['critical'] == 1
    return 3 if count['major'] > 1
    return 2 if count['major'] == 1
    return 1 if count['minor'] > 1
    return 1 if count['cosmetic'] == 1 && count['minor'] == 1
    0
  end
end
