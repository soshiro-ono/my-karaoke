require 'rails_helper'

describe Song do
  before do
    @song = FactoryBot.build(:song)
  end

  describe '曲投稿' do
    context '投稿がうまくいくとき' do
      it "title,artist,gender_id,interval_id,genre_id,populur_idが存在すれば登録できる" do
        expect(@song).to be_valid
      end
    end


    # 異常系
    context '投稿がうまくいかないとき' do

      it "titleが空であれば投稿できない" do
        @song.title = ""
        @song.valid?
        expect(@song.errors.full_messages).to include("Title can't be blank")
      end

      it "artistが空では登録できない" do
        @song.artist = ""
        @song.valid?
        expect(@song.errors.full_messages).to include("Artist can't be blank")
      end

      it "gender_idが空では登録できない" do
        @song.gender_id = ""
        @song.valid?
        expect(@song.errors.full_messages).to include("Gender can't be blank")
      end

      it "genre_idが空では登録できない" do
        @song.genre_id = ""
        @song.valid?
        expect(@song.errors.full_messages).to include("Genre can't be blank")
      end

      it "interval_idが空では登録できない" do
        @song.interval_id = ""
        @song.valid?
        expect(@song.errors.full_messages).to include("Interval can't be blank")
      end

      it "populur_idが空では登録できない" do
        @song.populur_id = ""
        @song.valid?
        expect(@song.errors.full_messages).to include("Populur can't be blank")
      end

    end
  end
end