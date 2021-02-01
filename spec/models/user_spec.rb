require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abc", email: "", password: "00000000", password_confirmation: "00000000", last_name: "山田", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name: "山田", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", last_name: "山田", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", first_name: "", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_katakanaが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", first_name: "太郎", last_name_katakana: "", first_name_katakana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name katakana can't be blank")
    end
    it "first_name_katakanaが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name: "山田", first_name: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
