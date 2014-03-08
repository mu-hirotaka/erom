class ArticleComment < ActiveRecord::Base
  attr_accessible :comment, :article_id, :elapsed_time
  belongs_to :article

  def hour
    (self.elapsed_time / 3600).to_i
  end
  def minute
    ((self.elapsed_time - self.hour * 3600) / 60).to_i
  end
  def second
    (self.elapsed_time - self.hour * 3600 - self.minute * 60).to_i
  end
  def formated_elapsed_time
    sprintf("%02d:%02d:%02d", self.hour, self.minute, self.second)
  end
end
