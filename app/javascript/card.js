const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  // console.log(form)
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    //1クレジット情報入力
    //2card.jsが実装される
    //3Payjpにカードの情報を送る
    //4Payjpから帰ってきた、トークンを準備してHTMLの要素に挿入する
    //5JS内の処理が終わったら、次にサーバー側にリクエストを送信する。

    // console.log("test")
    // console.log(card)
    // console.log(process.env.PAYJP_PUBLIC_KEY)
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        // console.log("成功")
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};

window.addEventListener("load", pay);