require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'ユーザ新規登録テスト' do
        context '名前とemailとpasswordがある' do
            it 'アカウントが新規で作成される' do
                empty_name = FactoryBot.build(:user)
                expect(empty_name).to be_valid
            end
        end
        context '名前が空の場合' do
            it 'バリデーションエラー(nameのNull制約)となり失敗する' do
                empty_name = FactoryBot.build(:user, name: nil)
                expect(empty_name).not_to be_valid
            end
        end
        context '名前が30文字以上の場合' do
            it 'バリデーションエラー(nameの文字数制限)となり失敗する' do
                empty_name = FactoryBot.build(:user, name: "あ"*31)
                expect(empty_name).not_to be_valid
            end
        end
        context 'emailが空の場合' do
            it 'バリデーションエラー(emailのNull制約)となり失敗する' do
                empty_name = FactoryBot.build(:user, email: nil)
                expect(empty_name).not_to be_valid
            end
        end
        context 'emailの形式が異なる場合' do
            it 'バリデーションエラー(emailのフォーマット制限)となり失敗する' do
                empty_name = FactoryBot.build(:user, email: "email.com")
                expect(empty_name).not_to be_valid
            end
        end
        context 'passwordが空の場合' do
            it 'バリデーションエラー(passwordのNull制約)となり失敗する' do
                empty_name = FactoryBot.build(:user, password: nil)
                expect(empty_name).not_to be_valid
            end
        end
        context 'passwordが空の場合' do
            it 'バリデーションエラー(passwordの文字数制限)となり失敗する' do
                empty_name = FactoryBot.build(:user, password: "pass")
                expect(empty_name).not_to be_valid
            end
        end
    end
end
