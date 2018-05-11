defmodule ParameterizeTest do
  use ExUnit.Case
  doctest Parameterize

  test "alphanumeric characters to lowercase" do
    alnums = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    assert Parameterize.parameterize(alnums) == "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz0123456789"
  end

  test "returns nil if input cannot be slugified" do
    assert Parameterize.parameterize("🍕") == nil
  end

  test "non-alphanumeric ASCII characters are stripped" do
    input =
      Enum.into(?!..?/, []) ++
      Enum.into(?:..?@, []) ++
      Enum.into(?[..?`, []) ++
      Enum.into(?{..?~, [])
      |> List.to_string()

    assert Parameterize.parameterize(input) == nil
  end

  test "replace whitespaces and delimiters with a single separator" do
    assert Parameterize.parameterize("Hello,  World!") == "hello-world"
    assert Parameterize.parameterize("  Hello,\t World!\n") == "hello-world"
  end

  test "arabic letters" do
    assert Parameterize.parameterize("مرحبا بالعالم") == "mrhb-blaalm"
  end

  test "amharic letters" do
    assert Parameterize.parameterize("ሰላም ልዑል") == "salaame-leule"
  end

  test "armenian letters" do
    assert Parameterize.parameterize("Բարեւ աշխարհ") == "barew-ashkharh"
  end

  test "bengali letters" do
    assert Parameterize.parameterize("ওহে বিশ্ব") == "ohe-bishb"
  end

  test "burmese letters" do
    assert Parameterize.parameterize("မင်္ဂလာပါကမ္ဘာလောက") == "mngglaapkmbhaaleaak"
  end

  test "chinese characters" do
    assert Parameterize.parameterize("你好，世界") == "nihaoshijie"
  end

  test "gujarati letters" do
    assert Parameterize.parameterize("હેલો, વિશ્વ") == "helo-vishv"
  end

  test "greek letters" do
    assert Parameterize.parameterize("Γεια σας, τον κόσμο") == "geia-sas-ton-kosmo"
  end

  test "hebrew letters" do
    assert Parameterize.parameterize("שלום, עולם") == "shlvm-vlm"
  end

  test "hindi letters" do
    assert Parameterize.parameterize("नमस्ते दुनिया") == "nmste-duniyaa"
  end

  test "japanese characters" do
    assert Parameterize.parameterize("こんにちは") == "konnitiha"
  end

  test "kannada letters" do
    assert Parameterize.parameterize("ಹಲೋ, ಪ್ರಪಂಚ") == "hleuu-prpnc"
  end

  test "khmer letters" do
    assert Parameterize.parameterize("សួស្តី​ពិភពលោក") == "suastiibibhblook"
  end

  test "korean characters" do
    assert Parameterize.parameterize("안녕하세요, 세계") == "annyeonghaseyo-segye"
  end

  test "lao letters" do
    assert Parameterize.parameterize("ສະ​ບາຍ​ດີ​ຊາວ​ໂລກ") == "sabaanydiisaawolk"
  end

  test "malayalam letters" do
    assert Parameterize.parameterize("ഹലോ വേൾഡ്") == "hleeaa-veedd"
  end

  test "punjabi letters" do
    assert Parameterize.parameterize("ਸਤਿ ਸ੍ਰੀ ਅਕਾਲ ਦੁਨਿਆ") == "sti-srii-akaal-duniaa"
  end

  test "russian letters" do
    assert Parameterize.parameterize("Привет мир") == "privet-mir"
  end

  test "sinhalese letters" do
    assert Parameterize.parameterize("හෙලෝ වර්ල්ඩ්") == "heleaa-vrldd"
  end

  test "tamil letters" do
    assert Parameterize.parameterize("வணக்கம், உலகம்") == "vnnkkm-ulkm"
  end

  test "telugu letters" do
    assert Parameterize.parameterize("హలో, ప్రపంచం") == "hloo-prpncn"
  end

  test "thai letters" do
    assert Parameterize.parameterize("สวัสดีชาวโลก") == "swasdiichaawolk"
  end

  test "vietnamese letters" do
    assert Parameterize.parameterize("Chào thế giới") == "chao-the-gioi"
  end

  test "yiddish letters" do
    assert Parameterize.parameterize("העלא וועלט") == "hl-vvlt"
  end
end
