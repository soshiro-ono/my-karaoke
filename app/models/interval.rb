class Interval < ActiveHash::Base
  self.data = [
    { id: 1, name: '高い' },
    { id: 2, name: '低い' },
    { id: 3, name: '丁度良い' },
    { id: 4, name: 'ギリギリ出る' },
    { id: 5, name: 'ギリギリ出ない' },
    { id: 6, name: 'その他' }
  ]
  end