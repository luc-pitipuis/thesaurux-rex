require 'epub'

class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) }
  has_attached_file :book
  validates_attachment_file_name :book, matches: [/epub\Z/, /mobi\Z/]
  validates_attachment_presence :book
  before_save :extract_metadata
  serialize :metadata

  def display_name
    @display_name ||= if metadata?
      title = metadata.title 
      authors = metadata.creators
      title.present? ? [title, authors].compact.join(' - ').force_encoding('UTF-8') : book_file_name
    else
        book_file_name
    end
  end
  
  def extract_metadata
  #return unless ebook?
    path = book.queued_for_write[:original].path
    parsed_book = EPUB::Parser.parse(path)
    puts parsed_book.metadata
    self.metadata = parsed_book.metadata
  end
end
