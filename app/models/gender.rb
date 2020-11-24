class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '男性アーティスト' },
    { id: 2, name: '女性アーティスト' }
  ]
  end