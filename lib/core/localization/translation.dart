import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'chooseLang': 'إختر اللغة',
          'lang': 'اللغة',
          'ar': 'العربية',
          'en': 'English',
          'myInfo': 'معلوماتي',
          'continue': 'متابعة',
          'authHeader': 'أهلا بك ',
          'authLoginBody':
              'قم بتسجيل الدخول بواسطة بريدك الالكتروني والرقم السري أو بإحدى حساباتك على مواقع التواصل الاجتماعي',
          'authSignUpBody':
              'قم بإنشاء حساب بواسطة بريدك الالكتروني, الرقم السري, ورقم الهاتف أو بإحدى حساباتك على مواقع التواصل الاجتماعي',
          'save': 'حفظ',
          'edit': 'تعديل',
          'general': 'عام',
          'yes': 'نعم',
          'no': 'لا',
          'ok': 'حسنا',
          'on': 'مفعل',
          'off': 'متوقف',
          'cancel': 'إلغاء',
          'delete': 'حذف',
          'seeAll': 'عرض الكل',
          'confirm': 'تأكيد',
          'apply': 'تطبيق',
          'search': 'بحث',
          'notification': 'إشعارات',
          'attention': 'تنبيه',
          'success': 'تم بنجاح',
          'loading': 'جار التحميل ....',
          'email': 'البريد الالكتروني',
          'userName': 'إسم المستخدم',
          'phone': 'رقم الهاتف',
          'password': 'الرقم السري',
          'oldPassword': 'الرقم السري القديم',
          'offers': 'العروض',
          'enterEmail': 'أدخل البريد الالكتروني',
          'emailUsed': 'البريد الالكتروني مستخدم من قبل',
          'phoneUsed': 'رقم الهاتف مستخدم من قبل',
          'enterPassword': 'أدخل الرقم السري',
          'enterOldPassword': 'أدخل الرقم السري القديم',
          'oldPasswordIncorrect': ' الرقم السري القديم غير صحيح',
          'reEnterPassword': 'أعد إدخال الرقم السري',
          'enterUserName': 'أدخل إسم المستخدم',
          'enterPhone': 'أدخل رقم الهاتف',
          'signin': 'تسجيل الدخول',
          'login': 'تسجيل الدخول',
          'logout': 'تسجيل الخروج',
          'signup': 'التسجيل',
          'forget': 'نسيت الرقم السري ؟',
          'dontHaveAccount': 'لا تمتلك حساب ؟ قم بـ',
          'haveAccount': 'بالفعل لديك حساب ؟ قم بـ',
          'forgetHeader': 'التحقق من البريد الالكتروني',
          'forgetBody': 'الرجاء إدخال البريد الالكتروني ليتم ارسال رمز التحقق',
          'forgetTitle': 'نسيت الرقم السري',
          'checkEmail': 'تحقق!',
          'verificationCode': 'رمز التحقق',
          'verificationHeader': 'التحقق من الرمز',
          'verificationBody':
              'أدخل رمز التحقق الذي تم إرساله الى البريد الالكتروني ',
          'resetPasswordTitle': 'تغيير كلمة السر ',
          'resetPasswordHeader': 'إعادة تعيين كلمة السر',
          'resetPasswordBody': 'الرجاء كتابة كلمة سر جديدة ',
          'successSignupHeader': 'تم تسجيل الحساب بنجاح',
          'successSignup': 'تم إنشاء الحساب بنجاح',
          'successSignupButton': 'الذهاب الى تسجيل الدخول ',
          'successReset': 'تم إعادة تعيين الرقم السري بنجاح ',
          'cong': 'تهانينا',
          'Choose Product': 'إختر منتج',
          'Choose Product Body':
              'لدينا أكثر من ١٠٠ الاف منتج \n قم بإختيار منتجاتك من متجرنا الالكتروني',
          'Easy & Safe Payment': 'سهل وأمن للشراء',
          'Easy & Safe Payment Body':
              'يمكنك الدفع نقدا \n أو بواسطة بوابات الدفع الالكنروني\n المعتمدة والموثوقة',
          'Track your Order': 'تتبع طلباتك',
          'Track your Order Body':
              'يمكنك تتبع طلبك في كل مرحلة\n أيضا يمكنك تتبع طلباتك من خلال الخريطة',
          'userNameValidError': 'إسم مستخدم غير صحيح',
          'emailValidError': 'بريد الكتروني غير صحيح',
          'phoneValidError': 'رقم هاتف غير صالح',
          'passwordValidError': 'رقم سري غير صحيح',
          'minValidError': 'هذا الحقل لا يمكن ان يكون اقل من ',
          'maxValidError': 'هذا الحقل لا يمكن ان يكون أكبر من ',
          'emptyValidError': 'هذا الحقل لا يمكن ان يكون فارغ ',
          'exitAttention': 'هل انت متأكد من الخروج ؟ ',
          'statusOffline': 'لا يوجد اتصال بالانترنت',
          'statusServer': 'خطأ في الاتصال بالخادم',
          'statusFailed': 'لا يوجد بيانات ',
          'emailOrPhoneUsed': 'البريد الاكتروني او رقم الهاتف مستخدم بالفعل ',
          'emailOrPasswordError': 'البريد الاكتروني او الرقم السري خاطئ ',
          'codeError': 'الرمز الذي ادخلته خاطئ',
          'emailNotFound': 'البريد الذي ادخلته غير موجود',
          'passwordDontMatch': 'الرقم السري غير متطابق ',
          'productForYou': 'منتجات من أجلك ....',
          'findProduct': 'ابحث عن منتجاتك',
          'categories': 'التصنيفات',
          'cart': 'العربة',
          'home': 'الرئيسية',
          'setting': 'الاعدادت',
          'profile': 'الحساب',
          'favorite': 'المفضلة',
          'color': 'اللون',
          'addToCart': 'إضافة الى السلة',
          'goToCart': 'الذهاب الى السلة',
          'jd': ' دينار ',
          'addFavorites': 'تم الاضافة الى المفضلة',
          'removeFavorites': 'تم الحذف من المفضلة',
          'verifyAccount': 'الرجاء تأكيد الحساب لتتمكن من تسجيل الدخول',
          'goToVerify': 'الذهاب إلى صفحة التأكيد',
          'resendVerify': 'إعادة إرسال رمز التأكيد',
          'successResend': 'تم إعادة إرسال رمز التأكيد',
          'contactUs': 'تواصل معنا',
          'aboutUs': 'حول التطبيق',
          'address': 'العنوان',
          'allAddress': 'العناوين',
          'addAddress': 'اضافة عنوان',
          'editAddress': ' حذف عنوان',
          'deleteAddress': 'تعديل عنوان',
          'checkout': 'إتمام الشراء',
          'total': 'المجموع الاجمالي',
          'deliveryCharge': 'رسوم الشحن',
          'youHave': ' لديك ',
          'itemsInCart': ' من المنتجات في عربتك  ',
          'addCart': 'تم الاضافة الى العربة',
          'removeCart': 'تم الحذف من العربة',
          'enableLocation': 'الرجاء تفعيل خدمات الموقع',
          'enableLocationAccess':
              'الرجاء السماح للتطبيق بالوصول الى خدمات الموقع',
          'goToSetting': 'الذهاب الى الاعدادات',
          'city': 'المدينة',
          'street': 'الشارع',
          'note': 'ملاحظات',
          'name': 'الاسم  ',
          'add': 'إضافة',
          'haveCoupon': 'هل لديك كوبون خصم ؟',
          'discount': 'الخصم',
          'price': 'السعر ',
          'subPrice': 'السعر الفرعي',
          'couponError': 'هذا الكوبون غير صالح او منتهي الصلاحية ',
          'couponSuccess': 'تم تطبيق هذا الكوبون بنجاح ',
          'choosePayMethod': 'إختر وسيلة الدفع :',
          'cash': 'نقداّ ',
          'creditCard': 'البطاقات الإتمانية ',
          'paypal': 'بايبال ',
          'onDelivered': 'الدفع عند التوصيل',
          'delivery': 'توصيل',
          'pickup': 'إستلام',
          'chooseOrderType': ' إختر طريقة الطلب : ',
          'chooseLocation': ' إختر الموقع :',
          'pay': 'دفع',
          'emptyCart': 'السلة فارغة!',
          'error': 'خطأ',
          'tryAgain': 'الرجاء المحاولة لاحقا !',
          'orderSuccess': 'تم الطلب بنجاح',
          'checkoutError':
              'يرجى التأكد من تحديد طريقة الدفع أو طريقة توصيل الطلب',
          'locationError': 'يرجى التأكد من تحديد موقع توصيل الطلب',
          'noLocation': 'ليس هنالك مواقع محفوظة من قبل !',
          'goToLocation': 'إضغط هنا لاضافة موقع!',
          'myOrders': 'طلباتي',
          'all': 'الكل',
          'completed': 'مكتمل',
          'canceled': 'ملغي',
          'onTheRoad': 'على الطريق',
          'pending': 'قيد الانتظار',
          'approved': 'موافق عليه',
          'ordersDetails': 'تفاصيل الطلب',
          'orders Approve': 'تم قبول الطلب',
          'orderNumber': 'رقم الطلب ',
          'paymentMethod': 'وسيلة الدفع ',
          'orderType': 'نوع الطلب ',
          'orderTime': 'وقت الطلب ',
          'quantity': 'الكمية',
          'tot': 'المجموع الكلي',
          'orderPrice': 'سعر الطلب ',
          'product': 'المنتج',
          'deliverTo': 'التوصيل الى',
          'paymentInfo': 'معلومات الدفع',
          'ratings': 'التقييمات',
          'rate': 'قيم  ',
          'order': 'الطلب',
          'item': 'المنتج',
          'ratingDialog': 'تقييم',
          'submit': 'تم',
          'rateHint': 'ضع تعليقك هنا',
          'rateDialogBody':
              'اضغط على النجوم لتعيين تقييمك. أضف المزيد من الوصف هنا إذا كنت تريد.',
          'topSelling': 'الاكثر مبيعا',
          'support': 'الدعم',
          'userSettings': 'إعدادات المستخدم',
          'deleteAccount': 'حذف الحساب',
          'pin': 'الرمز الشخصي',
          'biometric': 'المقاييس الحيوية',
          'enterPIN': 'ادخل الرمز الشخصي',
          'enterNewPIN': 'ادخل الرمز الشخصي الجديد المراد استخدامه في التطبيق',
          'enableBio':
              'استخدم بصمة إصبعك أو معرف الوجه لتمكين المقاييس الحيوية',
          'fromGallery': 'من الكاميرا',
          'fromCamera': 'من الاستوديو',
          'selectBranch': "إختر الفرع",
          'hello': "أهلا",
          'howHelp': "كيف يمكننا إسعادك اليوم؟",
          'searchEmpty': "لا يمكنك البحث عن قيمة فارغة",
          'noResult': "لم يتم العثور على نتائج",
          'backToHome': "العودة الى الرئيسية",
          'noConnection': "الرجاء التأكد من الاتصال بالانترنت",
          'cartItem': "منتج",
          'cartItems': "منتجات",
          'addNote': "إضافة ملاحظة",
          "notDontSave": "لم يتم حفظ الملاحظة",
          "noteDone": "تم حفظ الملاحظة",
          "enterNote": "أدخل الملاحظة",
          "branchClose": "هذا الفرع مغلق لا يمكنك الطلب منه حاليا",
          "back": "رجوع",
          "searching": "جار البحث ...",
          "branch": "الفرع",
          "calculateDelivery": "جار إحتساب سعر التوصيل...",
          "size": "الوزن",
          "weight": "الحجم",
          "pressToSelectSubItems": "إضغط لأختيار الوزن او الحجم",
          "branch_401": "عذرا هذا الفرع مغلق حاليا",
          "accept": "قبول",
          "reject": "رفض",
          "rejected": "مرفوض",
          "order_state_1": "تم قبول الطلب بنجاح",
          "order_state_2": "الطلب الان في الطريق اليك",
          "order_state_3":
              "تم توصيل طلبك بنجاح الرجاء تقييم الطلب من خلال صفحة التقيمات",
          "order_state_4": "تم إلغاء الطلب ",
          "order_state_5": "تم رفض الطلب من قبل المتجر",
          "user": "مستخدم",
        },
        'en': {
          'chooseLang': 'Choose Language',
          'lang': 'Language',
          'ar': 'العربية',
          'en': 'English',
          'myInfo': 'My Information',
          'continue': 'Continue',
          'authHeader': 'Welcome Back',
          'authLoginBody':
              'Sign in with your Email and Password\nOR Continue with your Social Media Account',
          'authSignUpBody':
              'SignUp with your Email, Password, Phone Number \nOR Continue with your Social Media Account',
          'save': 'Save',
          'edit': 'Edit',
          'general': 'General',
          'yes': 'Yes',
          'no': 'No',
          'ok': 'Ok',
          'on': 'On',
          'off': 'Off',
          'cancel': 'Cancel',
          'delete': 'Delete',
          'seeAll': 'See All',
          'confirm': 'Confirm',
          'apply': 'Apply',
          'search': 'Search',
          'notification': 'Notification',
          'attention': 'Attention',
          'success': 'Success',
          'loading': 'Loading ...',
          'email': 'Email',
          'userName': 'User Name',
          'phone': 'Phone',
          'password': 'Password',
          'oldPassword': 'Old Password',
          'enterEmail': 'Enter your Email',
          'emailUsed': 'Email You Entered Are Using Before To Other User',
          'phoneUsed':
              'Phone Number You Entered Are Using Before To Other User',
          'enterPassword': 'Enter your Password',
          'enterOldPassword': 'Enter your Old Password',
          'oldPasswordIncorrect': 'Your Old Password is incorrect',
          'reEnterPassword': 'Re Enter your Password',
          'enterUserName': 'Enter your User name',
          'enterPhone': 'Enter your Phone number',
          'signin': 'Sign in',
          'login': 'Login',
          'signup': 'Sign Up',
          'logout': 'Logout',
          'forget': 'Forget Password ?',
          'dontHaveAccount': 'Don\'t have an Account ? ',
          'haveAccount': 'Already have an Account ? ',
          'forgetHeader': 'Check Email',
          'forgetBody':
              'Please enter your Email to receive A Verification Code',
          'forgetTitle': 'Forget Password',
          'checkEmail': 'Check!',
          'verificationCode': 'Verification Code',
          'verificationHeader': 'Check Verification Code',
          'verificationBody': 'Please Enter the Digit Code  Sent to ',
          'resetPasswordTitle': 'Change Password',
          'resetPasswordHeader': 'New Password',
          'resetPasswordBody': 'Please Enter the  New Password ',
          'successSignupHeader': 'Success SignUp',
          'successSignup': 'Successfully Register',
          'successReset': 'Success To Change The Password',
          'successSignupButton': 'Go to Login',
          'cong': 'Congratulations',
          'Choose Product': 'Choose Product',
          'Choose Product Body':
              'We have a 100K+ product choose\nyour product from \nour e-commerce shop.',
          'Easy & Safe Payment': 'Easy & Safe Payment',
          'Easy & Safe Payment Body':
              'Easy Checkout & safe payment\nmethod , Trusted by our Customers\nFrom All the World.',
          'Track your Order': 'Track your Order',
          'Track your Order Body':
              'Best Tracker has been used for \ntrack your order ,You\'ll know where\nyour product is at the moment.',
          'userNameValidError': 'Not Valid User Name',
          'emailValidError': 'Not Valid Email',
          'phoneValidError': 'Not Valid Phone Number',
          'passwordValidError': 'Not Valid Password',
          'minValidError': 'The Minimum number of characters is ',
          'maxValidError': 'The Maximum number of characters is ',
          'emptyValidError': 'This field is can\'t be Empty',
          'exitAttention': 'Are you sure to exit ?',
          'statusOffline': 'No Internet Connection',
          'statusServer': 'Server Failed ',
          'statusFailed': 'No Data Available',
          'emailOrPhoneUsed': 'The Email or Phone is already Used',
          'emailOrPasswordError': 'The Email or Password is Incorrect',
          'codeError': 'The Code you Entered is not valid',
          'emailNotFound': 'The Email you Entered is not Found',
          'passwordDontMatch': "The Password isn't Matching",
          'productForYou': 'Proudest For You ....',
          'findProduct': 'Find your Product',
          'offers': 'Offers',
          'categories': 'Categories',
          'cart': 'Cart',
          'home': 'Home',
          'setting': 'Setting',
          'profile': 'Profile',
          'favorite': 'Favorite',
          'color': 'Color',
          'addToCart': 'Add to Cart',
          'goToCart': 'Go to Cart',
          'jd': ' JD',
          'addFavorites': 'Add To Favorites!',
          'removeFavorites': 'Removed From Favorites!',
          'verifyAccount': 'Please Verify your account To Login',
          'goToVerify': 'Go To Verify Page!',
          'resendVerify': 'Resend Code',
          'successResend': 'Success Resend Code',
          'contactUs': 'Contact us',
          'aboutUs': 'About us',
          'address': 'Address',
          'allAddress': 'Addresses',
          'addAddress': 'Add Address',
          'editAddress': 'Edit Address',
          'deleteAddress': 'Delete Address',
          'checkout': 'Checkout',
          'total': 'Total Price',
          'deliveryCharge': 'Delivery Charge',
          'youHave': 'You Have ',
          'itemsInCart': ' Items In your Cart',
          'addCart': 'Add To Cart!',
          'removeCart': 'Removed From Cart!',
          'enableLocation': 'Please Enable Location ',
          'enableLocationAccess':
              'Please Allow Application to Access your Location ',
          'goToSetting': 'Go To Setting',
          'city': 'City ',
          'street': 'Street ',
          'note': 'Note ',
          'name': 'Name ',
          'add': 'Add ',
          'haveCoupon': 'Do You have a Discount?',
          'discount': 'Discount',
          'price': 'Price',
          'subPrice': 'Sub Price',
          'couponError': 'This Coupon is not available or Expired.',
          'couponSuccess': 'This Coupon is Applied Successfully.',
          'choosePayMethod': 'Choose Payment Method :',
          'cash': 'Cash ',
          'creditCard': 'Credit Card ',
          'paypal': 'Paypal ',
          'onDelivered': 'On Delivered ',
          'delivery': 'Delivery',
          'pickup': 'Pickup',
          'chooseOrderType': 'Choose Order Type :',
          'chooseLocation': 'Choose your Location :',
          'pay': 'Pay',
          'emptyCart': 'Empty Cart!',
          'error': 'Error',
          'tryAgain': 'Try Again Later !',
          'orderSuccess': 'The order has been Successfully',
          'checkoutError':
              'Please sure you Select the Payment Method or Orders delivery Method',
          'locationError':
              'Please sure you Select the Location Orders delivery ',
          'myOrders': 'My Orders',
          'goToLocation': 'Press Here To Add Locations',
          'noLocation': 'No Location Saved!',
          'all': 'All',
          'completed': 'Completed',
          'canceled': 'Canceled',
          'onTheRoad': 'On The Road',
          'pending': 'Pending',
          'approved': 'Approved',
          'ordersDetails': 'Orders Details',
          'orders Approve': 'Orders Approve',
          'orderNumber': 'Order Number',
          'paymentMethod': 'Payment Method ',
          'orderType': 'Order Type ',
          'orderTime': 'Order Time ',
          'quantity': 'Quantity',
          'tot': 'Total',
          'orderPrice': 'Order Price',
          'product': 'Product',
          'deliverTo': 'Deliver To :',
          'paymentInfo': 'Payment Information :',
          'ratings': 'Ratings',
          'rate': 'Rate The ',
          'order': 'Order',
          'item': 'Product',
          'ratingDialog': 'Rating Dialog',
          'submit': 'Submit',
          'rateHint': 'Set your comment here',
          'rateDialogBody':
              'Tap a star to set your rating. Add more description here if you want.',
          'topSelling': 'Top Selling',
          'support': 'Support',
          'userSettings': 'User Settings',
          'deleteAccount': 'Delete Account',
          'pin': 'PIN',
          'biometric': 'Biometric',
          'enterPIN': 'Enter Your PIN',
          'enterNewPIN':
              'Enter The New PIN you wont to used in the Application',
          'enableBio': 'Use Your Fingerprint or Face ID to Enable Biometric',
          'fromGallery': 'From Gallery',
          'fromCamera': 'From Camera',
          'selectBranch': "Select Branch",
          'hello': "Hello ",
          'howHelp': "How can we make you happy today?",
          'searchEmpty': "You Can't Search for Empty Field",
          'noResult': "No Result Found",
          'backToHome': "Back To Home",
          'noConnection': "Please Connect To The Internet",
          'cartItems': "Items",
          'cartItem': "Item",
          'addNote': "Add Note",
          "notDontSave": "Note Did Not Save",
          "noteDone": "Note Saved Done",
          "enterNote": "Enter Note",
          "branchClose": "This Branch Closed, Cannot Be Order",
          "back": "Back",
          "searching": "Searching ...",
          "branch": "Branch",
          "calculateDelivery": "Calculating Delivery Charge...",
          "size": "Size",
          "weight": "Weight",
          "pressToSelectSubItems": "Click To Select Weight or Size",
          "branch_401": "Sorry,Branch is Closed Now,",
          "accept": "Accept",
          "reject": "Reject",
          "rejected": "Rejected",
          "order_state_1": "Order Accepted Successfully",
          "order_state_2": "Your order on the road ,Be Ready",
          "order_state_3":
              "Order Delivered Successfully, Please Rate The Order from Rate Page in Settings",
          "order_state_4": "Order Cancelled Successfully",
          "order_state_5": "The Order is Rejected by the Store",
          "user": "User",
        },
      };
}
