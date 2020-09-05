require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwordとpassword_confirmation、date_of_birth、first_name、last_name、first_name_kana、last_name_kanaが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nameが40文字以下で登録できる" do
        @user.name = "kokooooooooooooooooookoko"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上、かつ半角英数字混合であれば登録できる" do
        @user.password = "aaaaa11111"
        @user.password_confirmation = "aaaaa11111"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "浜田はまだハマダ"
        expect(@user).to be_valid
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "健二けんじケンジ"
        expect(@user).to be_valid
      end
      it "first_nameのフリガナが全角（カタカナ）であれば登録できる" do
        @first_name_kana = "ハマダ"
        expect(@user).to be_valid
      end
      it "last_nameのフリガナが全角（カタカナ）であれば登録できる" do
        @last_name_kana = "ケンジ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが41文字以上であれば登録できない" do
        @user.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれていなければ登録できない" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "hhhhh"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角文字のみだと登録できない" do
        @user.password = "oooooooooooooo"
        @user.password_confirmation = "oooooooooooooo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = "5555555555"
        @user.password_confirmation = "5555555555"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationに相違があると登録できない" do
        @user.password = "5555555555"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "本名の名字が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "本名の名前が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "本名が全角（漢字・ひらがな・カタカナ）以外での入力では登録できない" do
        @user.first_name = "hamada"
        @user.last_name = "kenzi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
      end
      it "本名の名字のフリガナが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "本名の名前のフリガナが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "本名のフリガナが全角（カタカナ）以外での入力では登録できない" do
        @user.first_name_kana = "hamada"
        @user.last_name_kana = "kenzi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
      end
      it "生年月日が空では登録できない" do
        date_of_birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
    end
  end
end