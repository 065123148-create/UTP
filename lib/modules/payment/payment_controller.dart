// lib/modules/payment/payment_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PaymentController extends GetxController {
  // ==== DATA BOOKING (dikirim via Get.arguments) ====
  late final String bookingId;
  late final String villaName;
  late final int totalPrice;
  late final DateTime checkIn;
  late final DateTime checkOut;

  /// 0 = review
  /// 1 = pilih metode
  /// 2 = detail metode (transfer / qris)
  /// 3 = upload bukti
  /// 4 = sukses
  final step = 0.obs;

  final method = 'transfer'.obs; // 'transfer' | 'qris'
  final selectedBank = 'BCA'.obs;
  final saving = false.obs;

  final proofFile = Rx<XFile?>(null); // bukti pembayaran

  final Map<String, String> bankAccounts = const {
    'BCA': '123 138 138 0130108',
    'BRI': '7777 8888 9999',
    'Mandiri': '123 000 999 888',
    'BNI': '987 654 321 000',
  };

  String get selectedAccount => bankAccounts[selectedBank.value] ?? '-';

  String formatRupiah(int value) => 'Rp ${value.toString()}';

  String formatDate(DateTime d) => '${d.day}/${d.month}/${d.year}';

  @override
  void onInit() {
    super.onInit();
    // Ambil parameter dari Get.arguments
    final args = Get.arguments as Map<String, dynamic>?;

    if (args == null) {
      throw ArgumentError(
        'PaymentView membutuhkan arguments: bookingId, villaName, totalPrice, checkIn, checkOut',
      );
    }

    bookingId = args['bookingId'] as String;
    villaName = args['villaName'] as String;
    totalPrice = args['totalPrice'] as int;
    checkIn = args['checkIn'] as DateTime;
    checkOut = args['checkOut'] as DateTime;
  }

  void goToNextStep() {
    if (step.value < 4) step.value++;
  }

  void goBackStep() {
    if (step.value == 0) {
      Get.back();
    } else {
      step.value--;
    }
  }

  Future<void> pickProof() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      proofFile.value = result;
    }
  }

  /// Simpan info pembayaran ke Firestore HANYA ke dokumen bookings/{bookingId}
  Future<void> confirmPayment() async {
    if (proofFile.value == null) {
      Get.snackbar(
        'Bukti belum diupload',
        'Silakan upload bukti pembayaran terlebih dahulu.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    saving.value = true;

    try {
      final bookingRef = FirebaseFirestore.instance
          .collection('bookings')
          .doc(bookingId);

      await bookingRef.update({
        'status': 'pending',
        'payment_status': 'waiting_verification',
        'payment_method': method.value,
        'bank': method.value == 'transfer' ? selectedBank.value : null,
        'has_payment_proof': true,
        'payment_proof_file_name': proofFile.value!.name,
        'payment_proof_uploaded_at': FieldValue.serverTimestamp(),
      });

      saving.value = false;
      step.value = 4; // sukses
    } catch (e) {
      saving.value = false;
      Get.snackbar(
        'Error',
        'Gagal mengkonfirmasi pembayaran: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
