class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'POP' },
    { id: 2, name: 'ロック' },
    { id: 3, name: 'アニソン' },
    { id: 4, name: '洋楽' },
    { id: 5, name: '合唱曲' },
    { id: 6, name: 'その他' }
  ]
  end