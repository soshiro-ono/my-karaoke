class Song < ApplicationRecord
  belongs_to :user

  # アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :interval
  belongs_to_active_hash :genre
  belongs_to_active_hash :populur

  # アクティブハッシュのアソシエーション
end
