// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

import {Script, console2} from "forge-std/Script.sol";
import {KimchiVerifier} from "../src/Verifier.sol";
import "forge-std/console.sol";

contract Verify is Script {
    bytes verifier_index_binary =
        hex"de0015a6646f6d61696e82a474797065a6427566666572a464617461dc00ac00400000000000000e00000000400000000000000000000000000000000000000000000000000000000000000140ccb0190ccce6cc9ccc81ccabcc89cc97ccd87847ccbfccc65752cca76a7564cca937631b66cca7cce1cc8c6330cc856e7c61ccc201ccaaccadcce6ccaa2074cce13ecca9ccb4cca8cca8ccdc0dccb8514e1fcc81cce4ccd9cccd5156cc962d10cc841c6434cce9cceeccf8ccc0717767ccb07609ccf4cc8c6ecc8e55420d6811cce9cce9cce7066f031c28676666ccc6ccd4ccfbccf3cce7062d4acccacce95cccaecca9cc8b56cccd337cccb5ccb949ccaaccd9135acc94525b13ad6d61785f706f6c795f73697a65cd4000a77a6b5f726f777303a67075626c696300af707265765f6368616c6c656e67657300aa7369676d615f636f6d6d9782a9756e736869667465649182a474797065a6427566666572a464617461dc0020cc8e6a46ccc4cc9a5b053e3accd03acccacc896319ccab43cc88ccafcc887ecc84ccbc3dccacccfb49ccab67ccddcc93cc8aa773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200f751f4138cc9fccefcccaccc43accb9cca01b0810ccab2cccb74c70ccdfccd8cc9521ccc7cca0cccfcca15019ccdecca4a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00205ccc903d4275cc90cc98cc987acce8cca0cc946a33ccdaccb8ccbb386052cc93ccdf725a29ccc840ccf4cc87ccd6ccabcc99a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccdd7526ccddcc86cca2cc9cccd6cc8f0acc937e062e56ccd25e3250cc90cc86ccc958cc84cce0cca5cc9701cc99cc8f7bcca5a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cc964300cc855f1c7bccb37b55cc854c582f48ccc54938ccab48cc815bccd64a5accc62dcc8c37ccddcce403a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccf9322c5458ccd204ccdecc90cce7ccfbcced5e5accb2ccfc4651ccba62297e0accfcccf2cccaccfbccb0cca05d0421a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccb3183eccf8ccf4cc9410cca465cca4ccd145cc97cc9a4e5fccb92fcceacc81ccd7767434cc99ccc7ccc428ccebccbb6819a773686966746564c0b1636f656666696369656e74735f636f6d6d9f82a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000040a773686966746564c0ac67656e657269635f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020723737cccf1cccc96bccb40021504a4fccf45d21cc914ecc94cc84ccf2113d66545a3826cc91cc9acc9c25a773686966746564c0a870736d5f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020723737cccf1cccc96bccb40021504a4fccf45d21cc914ecc94cc84ccf2113d66545a3826cc91cc9acc9c25a773686966746564c0b1636f6d706c6574655f6164645f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020723737cccf1cccc96bccb40021504a4fccf45d21cc914ecc94cc84ccf2113d66545a3826cc91cc9acc9c25a773686966746564c0a86d756c5f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020723737cccf1cccc96bccb40021504a4fccf45d21cc914ecc94cc84ccf2113d66545a3826cc91cc9acc9c25a773686966746564c0a9656d756c5f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020723737cccf1cccc96bccb40021504a4fccf45d21cc914ecc94cc84ccf2113d66545a3826cc91cc9acc9c25a773686966746564c0b3656e646f6d756c5f7363616c61725f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020723737cccf1cccc96bccb40021504a4fccf45d21cc914ecc94cc84ccf2113d66545a3826cc91cc9acc9c25a773686966746564c0b172616e67655f636865636b305f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020190c1bcc8c2123cc9301ccc0cccd623dcca5cc91cc84ccebcc871b15076bccf5ccc1ccd7497acc8acc99ccc2260acca4a773686966746564c0b172616e67655f636865636b315f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccfa37ccb2cccfcccb1a44cce4ccf8204dccb54fcc852335cce0075ecc8d6bcc87ccb4cca3ccb47444185c44ccedccafa773686966746564c0b6666f726569676e5f6669656c645f6164645f636f6d6dc0b6666f726569676e5f6669656c645f6d756c5f636f6d6dc0a8786f725f636f6d6dc0a8726f745f636f6d6dc0a573686966749782a474797065a6427566666572a464617461dc0020010000000000000000000000000000000000000000000000000000000000000082a474797065a6427566666572a464617461dc0020cce3cca214cce91334ccd0cccaccf1ccebcc85ccdf5bccd7524d73ccd5cceb7accaf742a7eccb2ccd40bccfdccc8cccdccb90082a474797065a6427566666572a464617461dc00206d0f4433cc9a33cc9fccb8cca4cce4cc9bccf109cc9620ccaa64cc9918482bcc95cca3cc97ccae39ccb9ccec5accd4770082a474797065a6427566666572a464617461dc0020ccb40923ccbd78cce619ccc80a7b39ccc0ccf3ccf11e48005519ccd2ccfeccf16a1f77ccd40545cce5ccc7770082a474797065a6427566666572a464617461dc0020ccf9ccc95cccd6ccb11b38ccdf7855ccfd4d2a036329ccadcccaccd613ccf100ccb92310cc9540356a597c0082a474797065a6427566666572a464617461dc00205a696526ccfa30cc9c412c10cce86604ccc3ccc0ccad2cccd9443dccd85bcc8232037212cc81cccfccbf330082a474797065a6427566666572a464617461dc002043423bccb307ccceccc1cc9f297c41cc88ccdeccb23acccc7b581271cc9b2eccaccccbccf1ccb7034acce6ccaccce800ac6c6f6f6b75705f696e64657886b16a6f696e745f6c6f6f6b75705f75736564c2ac6c6f6f6b75705f7461626c659182a9756e736869667465649182a474797065a6427566666572a464617461dc0020cce6cca15e7ecca10eccd2cc8f0f3361ccc7cca7ccf45ccced5e6d382017cc8ccc832cccfcccc0ccdf0e343eccb1cc80a773686966746564c0b06c6f6f6b75705f73656c6563746f727384a3786f72c0a66c6f6f6b7570c0ab72616e67655f636865636b82a9756e736869667465649182a474797065a6427566666572a464617461dc00201b24636044ccd6cced30ccc611cc85ccd45b2969cc98ccb811ccb754cca5507c08ccd1cc9124cc9b37ccc01721a773686966746564c0a566666d756cc0a97461626c655f69647382a9756e736869667465649182a474797065a6427566666572a464617461dc00205f28cc8bccb342cc8034cca922ccb3cce618ccea3ecc811eccdf61cc81ccb10b7eccf6ccc859ccfd03ccea2b39cca70ea773686966746564c0ab6c6f6f6b75705f696e666f83ab6d61785f7065725f726f7704ae6d61785f6a6f696e745f73697a6501a8666561747572657383a87061747465726e7384a3786f72c2a66c6f6f6b7570c2ab72616e67655f636865636bc3b1666f726569676e5f6669656c645f6d756cc2b16a6f696e745f6c6f6f6b75705f75736564c2b3757365735f72756e74696d655f7461626c6573c2b772756e74696d655f7461626c65735f73656c6563746f72c0";
    bytes proof_binary =
        hex"85ab636f6d6d69746d656e747384a6775f636f6d6d9f82a9756e736869667465649182a474797065a6427566666572a464617461dc002046ccdbcc9576ccfc514a0c5e5a53ccdaccddcc8dccc83ecc9ecce2316e7b48cccf6f6a0bcc91cca2cc97752821a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccfbcc8e22ccdeccd16fcccecc926dcce24d592065ccd77cccf77e1279227dcca9ccccccc6ccc2170fccb765ccc8cca8a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cc895a52ccb03017cc8d7842cc95377fcc94ccf8ccfacc92ccf378590eccfb5255cc876eccaaccd7cc88cca7cc8530cc80a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00207dcc9fccd832cc9bccaccc92cceeccc2cca210ccafcc8f19ccfbcc97ccf004ccb9cc987a70ccc8ccfcccad7c59ccbe59cc86cc92ccaaa773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cca5cc8accdd1d02cc863205ccedcccdcc976a0262ccadccca14cce0cce925545f08cc8f7b22ccfbcc82ccdfcca0cca0cc89a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cce53609ccf52cccdbcca9cc90cce91f6eccd17111ccb3cca3ccf5ccdc45ccb8ccfcccf5cceb6328603eccd9ccafccdbcca8cc94a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020382a2e2228ccecccad76025c50cc82ccbe02ccb6cc99ccaecce03ccc85cca9cc98cc8accc8500fccc6592bccc662cc80a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc002073ccd8ccd0ccec275538ccc4cc804b0fccfa0accc16ccc85ccbbccd94439ccbc34ccdc522dcce454ccf9ccec133a08a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccd365cc8b3a32cccfcc8f1c386b4273ccf12cccb9cc97ccba32cce2cc9f59ccae4bccc81e25cc9815ccc3ccf87d1fa773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00203056ccbaccc95dcc9eccd976ccef1264cc84ccfb13ccf601cc8c357fcceb031779cca811ccb21d1eccc1cc8359cc91a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00205fcce1ccf3cc91ccc91559765825ccc6cce3ccf2cc95506d0d2a59ccac1e4c3accf83e4accd64accf8cca7ccdacc88a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00206426ccd2ccb3ccd4cca51d3d57cca2643e1c10cc9d281163cccc71ccc3381eccbc7c56ccffcc9e4dccecccc110a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc002017cc81ccd7656f72434acced28cc9dcca422cce45bcc96cca82765ccc8ccc66870ccbacc93ccfb3f220dcc9320cca5a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc002034ccee4d3909ccf7ccf0cccdccbecca3cc82772128ccbdccd6cc8dccae0b207649cc96ccde03ccb267ccaacc9b584ecc84a773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cccf621620ccfaccf5ccc028ccdb7e6b51ccd34accea53230230ccb8cc81425dccfd5d0ecca136611e2a22a773686966746564c0a67a5f636f6d6d82a9756e736869667465649182a474797065a6427566666572a464617461dc00205acc906740cc9ecc8fcca636ccb80a31643e611fccb3ccf3cc81ccaa4c57ccd41fcca62a24ccd0ccc1ccfaccba5bcc99a773686966746564c0a6745f636f6d6d82a9756e736869667465649782a474797065a6427566666572a464617461dc0020cca7cc84275f2657cc8fccc33b5801ccbc2ccce87dccd3cced77306accdfccf967cc993950ccc65d364540cca582a474797065a6427566666572a464617461dc0020ccc7ccd2386dcc91cc8acc87ccf7ccd2ccb3ccc822cca9ccc0ccb25c7615cc9fccfd42ccda710e1acca24850cc9b5f523082a474797065a6427566666572a464617461dc00204423ccfeccb2ccecccb6ccac7b776c7d3a45ccd93e6e27cc9175ccc729cca1ccb90accdc2dccdc79cc9945cca21e82a474797065a6427566666572a464617461dc0020ccf34650ccca4009cceeccf6cc9dccabccc7ccee061c6b00ccf0ccefccdfccbe7639cc952dccdb542eccd42319ccd61b82a474797065a6427566666572a464617461dc0020ccf8ccccccd17ecc9454ccf4034fccafccad55cc8f65ccf0ccb405cce2517172ccafcc9309cc9dccaacc8a202eccc3ccdccc8782a474797065a6427566666572a464617461dc00201b67ccc761ccb2ccd8265accdfccca14cc96ccdc5a5fccef77ccd1053eccb55322ccb7ccc922ccf64837cc90ccad0182a474797065a6427566666572a464617461dc0020cca1103accceccec7c10cc93ccd25775ccceccf0361d52cceb173a465755ccf1ccfacc975e4025cc90cce0ccca23a773686966746564c0a66c6f6f6b757083a6736f727465649582a9756e736869667465649182a474797065a6427566666572a464617461dc0020cc94ccb421ccb7252ecca7ccfd413dccf17f71ccb95319ccaa3c2367cce53a3bccceccde62ccd646cce0cc8e5cccada773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc00201e2eccd952ccbb584003cc90ccffcc8ccc98cca75bcc9616230b3834ccbe7bccc8ccb82e194bccb9415e3accafa773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cccfcc934678ccd80d70ccadccf3ccc55a7fccb6ccfe74ccc214ccd900ccd673cc9c5851452b735162ccd5cc82ccada773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020cce130ccc238ccde2f74cce14a2accda78ccffccd2ccb6cc82cc8bccad7eccc648ccb737cc967d71cce3084a41cc961ba773686966746564c082a9756e736869667465649182a474797065a6427566666572a464617461dc0020ccc45132cc881e2324ccc0cca331cc9d1eccfa7748ccc9642469ccf121ccf7ccef11432dccfcccdd7ecc8fcc9ccc98a773686966746564c0a661676772656782a9756e736869667465649182a474797065a6427566666572a464617461dc00201d5dcccbccd52c19ccc9ccefcc9b30cce8cc9b646dccd419763c0eccb04d1677cc8f274957ccb70a04ccd6ccaea773686966746564c0a772756e74696d65c0a570726f6f6682a871756f7469656e7482a474797065a6427566666572a464617461dc0020ccf6ccd312122536cce4ccfeccb5cccfccc51eccac2236514f5563cca842cca1ccb2ccd2ccebccdd76ccd1ccdaccac51cc9aa8626c696e64696e6782a474797065a6427566666572a464617461dc002041ccc148ccf6040bcc933422ccefccfaccde5bccebcc84ccb7ccc5cce17a406571cc8609cc95cca8ccca41cc9ccc863d2ba56576616c73de001aa67075626c696382a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000a1779f82a47a6574619182a474797065a6427566666572a464617461dc0020ccf7ccefccbccce2ccb568cc9d07ccff65cc8bccd8cc9333cc9dccbdcc94cc9d4a19ccd9ccd9cca329440d7c26ccd0ccf0ccf308aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cc981575ccd516ccf7ccd7470ecc820965cc8e25165277cccdccba5e0a45cca05bcce662cc8d05cca4ccf2412d82a47a6574619182a474797065a6427566666572a464617461dc0020cca7ccceccba7034cca9cc9accf0306ecca72fccd61a4f0566cc92ccb1cc82206722643b4acc9cccb6cc8d0d112caa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccb9ccdf5450ccdbcca7cca5250258cca5cca2ccfeccb13cccfdccf6cc97cc80ccbd73cc99cc8dccd3ccd0ccbcccacccbccc8fccc17e2082a47a6574619182a474797065a6427566666572a464617461dc0020ccbaccc6cc85547c1bccc7ccc7cca7ccbc027eccd173cc86255d654acc8dcce83b211c00ccefccd7ccfeccd4ccdb0827aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccef47cc92ccd2cca0cc8b4c255e6a46453d3762ccdecc9466cceacccb7e071b25ccd01b4dccffcca2ccaacca82d82a47a6574619182a474797065a6427566666572a464617461dc0020ccdbccc009cc9047ccdaccb12b044fccd5461b0ccca24f52ccfacc860d35ccc33dcc83cc98510b571dccbeccdd13aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00201c6e3fccba5ccc85cc89cca703ccdacca270cce7cc9dccde55ccc3cc8041ccdb39ccbdcc95ccf2cceecc93ccc6ccc8ccf8ccc9512682a47a6574619182a474797065a6427566666572a464617461dc00202eccebcca90eccd609ccecccef3b4a61ccabccc40a4a6f31cce46c6d2b4eccad72ccfbccf4ccc30b1accb21a0aaa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccbbccbdccebccebccd3cc933758cc8d4051ccf0302c4c62cccd026accc2ccb4ccd7cccd524601ccc21359cca1ccfb2382a47a6574619182a474797065a6427566666572a464617461dc00201dcc9bcca0cccaccf538ccd97bcce4cca8cce843303fccb843ccb0ccc0ccbcccd5ccfbcc8f4dccd67a5805ccc5cce6cccdcc8d2eaa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020463341ccea67ccde6f19ccc35973cccd116124cccf19ccc37b4b2a2410cc88444957ccf0ccb8cc8bcc852282a47a6574619182a474797065a6427566666572a464617461dc0020ccd7ccb14fccf141cce7ccb6cc9f47ccb1ccfc2a621b622d15ccfc53ccc06c76cce0cc986c3ecc92ccc2ccd0ccabccf01aaa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00204dccf67f4d2dcc863c5d08ccab30083254cc92ccc4cca66f4d6e7668ccb1ccc7cc96ccdeccc4cccaccf1411a0482a47a6574619182a474797065a6427566666572a464617461dc0020ccbfcccf785accd61c42ccfd7accca6b3a72ccfb2a1cccd7662560232fcccacce04e48cc93cce2cce0ccd15b22aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cce8ccdbccf8cc9b1912cce87206ccb5ccf5ccd6cccdccb819ccde55cc8015cc870eccf8cc9dccf442cca97ecc8bccf6ccf20e2082a47a6574619182a474797065a6427566666572a464617461dc0020ccc07007cc98ccb1ccd1ccb54138362062ccf922ccbdcce6cc9acc9460cc874f554520155eccadcced7d4a0521aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cc8bcc90ccad646ccc856bccbecca4cccd43651477cccbccac6acc9dcce6cc8f1c50ccf1cca85ccc8eccebccc564ccafccf91e82a47a6574619182a474797065a6427566666572a464617461dc0020ccc634391c454accdacc8766ccb7cc940944ccf70309ccaeccb5ccb81a42cc98cce23d670e21cce26ecc943a06aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccceccdd14ccf37e26ccb67bcce7ccf5cce2ccf7220accbacce9280ccc85cccbccc0cc98486e001eccd5ccbdcca2061b2e82a47a6574619182a474797065a6427566666572a464617461dc00201516cccc11ccef60cca2ccf748cca6ccc8757d13cce0cca1cc95ccf3cccf7a4f3bcc9dccf066573f47ccc0ccc8cc9d1aaa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc002057cce1cccdcca33b21250e360accf5cc94401812545e51cc88556acce161ccbb5648cca627cce5cc92352382a47a6574619182a474797065a6427566666572a464617461dc00200a7bccf066ccdb5d76cca2ccf1ccdbccc22710cc9c1ecca6cca8cc936c77551c7bccad591712ccc1ccd61e6a14aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cc8fccd1ccd272cccfccbeccbdccd811ccdcccee48ccef53565043ccd6cc82ccfb65587f6cccdbccf7cccdccf2cc9eccedcce40a82a47a6574619182a474797065a6427566666572a464617461dc00200b44ccbdcc85cc8a1dcc8d186229ccc634cc9221632e3ccc9ccc88cc9a50cc87ccb7ccd66acca56ecceaccc3ccaa1a26aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccdecc95ccadccdf7910163117cc97cce941367368ccbf487608ccfa731537ccfb47cc81cce750ccc4ccf1ccdb2082a47a6574619182a474797065a6427566666572a464617461dc0020ccd31bccf155cc9acc993d36cc9512cce2ccf811ccd2cca5cca3cc9dccca71cc941e2532ccafccf7ccbbccc961361e0b26aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00206106ccee71384cccb0ccf6ccfacceb2f43cc8cccd670ccd7ccd1cc860ccce620ccee1f524e1d32ccddccbbcc946f2082a47a6574619182a474797065a6427566666572a464617461dc00204444ccc2cc96ccbccc8b6c3a1fcce436ccab0e41cc8450cc9dccfbcc9dcc815446ccb3ccfb514844ccc51106cca900aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020082a45ccd7ccf1cc9acc8fcc8651cc9acc9d50cc89cca30e465b4fcc9f4ccc9a4120cc9a52ccdfccfd0219ccc9cca11aa17a82a47a6574619182a474797065a6427566666572a464617461dc002024cceccccc6accb93b47cccf654138cc8e756e0b23ccf9cca76ecca6ccd3cccd142c692c4a28cce5ccf06a17aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccfdcc89cc9f16215e5ecca93bcc9fccf0ccc8ccfbccdf50087754cc86ccf2cc85ccffccbfccc8ccfa25523ecc9841ccd700a1739682a47a6574619182a474797065a6427566666572a464617461dc002035cc80cce3cc896e74260643ccc4050202143a6ccca810ccd5ccd5784733cccd684d1ecc89ccebccefccf616aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccadccd4ccbd1a64cca1532fccfccca7ccaa7c5307ccb0ccac7c0b3e3524ccc019ccf2ccad4accf4ccad3765ccdb2c82a47a6574619182a474797065a6427566666572a464617461dc002032ccf8ccfaccdd60ccb04f6c3f04ccd94667ccbdcc8f1dccc6cc87ccb35b48ccebcc8b357b700544ccfe6c7a24aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00204564ccf823cc8458cc8e42ccae3c1eccdcccf80c01ccc9ccba5ccc8acc8b6e046a4f26cc94cce835ccb218cceb0482a47a6574619182a474797065a6427566666572a464617461dc00200bcca97e35cce7ccf76fcc876dccfd44cce2ccae6d0cccc908ccaeccb22a15ccb4ccc2ccc4ccbbcca4cce8ccab4b5c5606aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc002014cce334cca9773f59ccf1cc95cccf68cce8ccccccfa6a5acc97cce01b1accbb07ccab49ccd253ccb367cce44cccb00b82a47a6574619182a474797065a6427566666572a464617461dc0020753c61cca071cc9ecc8d3b54322b23ccc85b6dccdcccb2ccf2cce9cca249656b59ccfc1c294830ccdd0207aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cc81cca5ccef75cca70059cce3cc89ccfecc94ccd26768cc9ccccacca6ccdeccfdccd1ccf0cceecc98ccefccd55410ccfeccc259ccc61582a47a6574619182a474797065a6427566666572a464617461dc0020ccf4ccd8ccab7121cc8dcccf2fccc01ecc9e71cce93bccc97fccc2ccf727693c3f0dccb0ccc7ccee5dccdbcc9333ccb314aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccb8cce727cc84ccaeccf45ccc89cc82cca8cc9a79485bccdccca2ccc8ccb4ccb1ccdaccfeccc7cca10eccaa6ecc85071807cc802882a47a6574619182a474797065a6427566666572a464617461dc002062456a79cccf7dcc9cccf9ccd0411216cc8660ccecccb45350043cccbf0046ccb169ccf35528cc92cca2ccee07aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccb2ccd0cc890accd0ccb526ccf8cc87ccdf13cceecce6cc9e7e033c0577321d0bccdb33ccd32431ccb77b24ccc62aac636f656666696369656e74739f82a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020000000000000000000000000000000000000000000000000000000000000000082a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000b067656e657269635f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000b1706f736569646f6e5f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000b5636f6d706c6574655f6164645f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000ac6d756c5f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000ad656d756c5f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000b7656e646f6d756c5f7363616c61725f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200000000000000000000000000000000000000000000000000000000000000000b572616e67655f636865636b305f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc0020ccd9cce41fccefccaaccf9ccb5145702272f7d3d60ccc6cc9c414dcca3cc8206ccf66e19cca1cc84cc9943cca40723aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc002069ccbe78cc99cc904a11cce304cc882e3dcc9ccccd2fccce6320cc9b0233ccb5cc86cceaccccccbe42cc9cccd261ccc61fb572616e67655f636865636b315f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc0020ccc7ccb75eccb746cc906d3eccf8cca6ccd5ccf4cc9eccce0a6eccb8ccbdccfe2b6d1d1f5ecc8bcca6cce6cca6ccd368ccd209aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00206acca4ccae47ccf6cc95cc91cc82660326cc8accfacc9bccadccc013332229ccacccb823232e37220b0fcce0cce31cba666f726569676e5f6669656c645f6164645f73656c6563746f72c0ba666f726569676e5f6669656c645f6d756c5f73656c6563746f72c0ac786f725f73656c6563746f72c0ac726f745f73656c6563746f72c0b26c6f6f6b75705f6167677265676174696f6e82a47a6574619182a474797065a6427566666572a464617461dc0020cccaccbc79cc97ccdfcce14c0d5918ccbcccac48cce452ccfc47cccdccce56ccabccc3cccb54cc9b1118cc9d0e08ccc108aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00206accc656ccc9436f74ccb557cc93cc8ecccf6c67cc8b3e0d0b4e167660cc9eccd0ccf5ccde0a73cccbccb73f27ac6c6f6f6b75705f7461626c6582a47a6574619182a474797065a6427566666572a464617461dc0020ccab51ccf2cce4cceccceccca96d0fccc5ccec1d7e71ccb0ccc4ccf0cce728ccee3fcca9ccb224cc8a48ccea18ccc368cccc16aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccc6ccf5cc9fcceccc85cc9acc89460accef2f731643cc9d5c01ccd82dcc943d6cccbecce65fccb9cc830f5a742a1bad6c6f6f6b75705f736f727465649582a47a6574619182a474797065a6427566666572a464617461dc00200a5acc9e0033ccfdcccb3f700d3953ccd4ccf310ccb2ccfeccb53a2ccca4ccd3cce2cce8ccdc2fcc99cc95ccfdcc88cce718aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cc94ccb723cc94ccfbccae44cce3ccba3dcc84ccedccca255179ccaeccf8ccc8cc8c1acc882eccfa3d0accd9485d5eccff0782a47a6574619182a474797065a6427566666572a464617461dc0020ccc365cc8805cc942b64cca0674fccbeccca5ccca8ccb1013b5accb32f3146ccb6ccaccc94cccdccd5cc8accd0cc9a3510aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc002018cccdccaccc88cc8073264b02cca5cccdcce4cc881ccca8cce666ccee76ccdacce7ccc3cca3ccd0cce1cca7ccf4cc8f5b07ccf62c82a47a6574619182a474797065a6427566666572a464617461dc002069cc88cc8e2dcca0ccf814cca8ccf2ccc2ccd3cc96ccb874cc83cca5cc90575ccceeccacccb3ccf76eccd8cc9ccc8e640852cc9d24aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc002003ccadccaa28ccc02308cca153ccac68ccf501cc9c00ccaecc877f630d3acca26750cc93ccb4165c23ccf7ccd50282a47a6574619182a474797065a6427566666572a464617461dc0020523a05652ecc8cccef0fcc8e76044acc95cce929ccdacc882632cc86cca8cc8a2fcc83ccac5834ccd121ccad711daa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020ccf63fcc8902cca355cca667451accd86ecce4ccb6cc8acce2ccc8ccc331696fcce404cc8d2c3a2fccd534ccc0cc8b1782a47a6574619182a474797065a6427566666572a464617461dc0020ccf3cc9805ccd77cccebcce1666d3f0a23cc8a0acc815bcc81cce5403a21ccb9ccc5ccdb1007ccf7cca9387e7410aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc00200b6ecce129ccac063902786dccd12dcc8b5ccc8925cc83cc941652cce72c63ccc87847cceb33ccf803041cb472756e74696d655f6c6f6f6b75705f7461626c65c0bd72756e74696d655f6c6f6f6b75705f7461626c655f73656c6563746f72c0b3786f725f6c6f6f6b75705f73656c6563746f72c0bb6c6f6f6b75705f676174655f6c6f6f6b75705f73656c6563746f72c0bb72616e67655f636865636b5f6c6f6f6b75705f73656c6563746f7282a47a6574619182a474797065a6427566666572a464617461dc002015ccba591a407170cca4ccaacccd3acc98ccd4724d5acc8ccc97cce61421cc95cc87ccdc20ccebcca31d6071cc8608aa7a6574615f6f6d6567619182a474797065a6427566666572a464617461dc0020cc991acc86cca8397b2e60ccd2ccc17042cced4fccb4ccd4ccd2ccb83accd6cc954579ccb35cccfc196d425c1816d921666f726569676e5f6669656c645f6d756c5f6c6f6f6b75705f73656c6563746f72c0a866745f6576616c3182a474797065a6427566666572a464617461dc0020cccc18ccb921783ecce52a3c7e3d1acc92ccf61b25392748cc8934184e0200ccb8ccb33023cca0060faf707265765f6368616c6c656e67657390";

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        KimchiVerifier verifier = new KimchiVerifier();
        verifier.setup();

        bool success = verifier.verify_with_index(
            verifier_index_binary,
            proof_binary
        );
        console.log(success);

        vm.stopBroadcast();
    }
}