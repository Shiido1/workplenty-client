import 'package:client/core/di/injector.dart';
import 'package:client/views/dashboard/card/presentation/provider/card_provider.dart';
import 'package:client/views/dashboard/chat/presentation/provider/chat_provider.dart';
import 'package:client/views/dashboard/gig/presentation/provider/artisan_provider.dart';
import 'package:client/views/dashboard/gig/presentation/provider/gig_provider.dart';
import 'package:client/views/dashboard/gig/presentation/provider/saved_gig_list_provider.dart';
import 'package:client/views/dashboard/profile/payout/presentation/stateManager/provider/payout_provider.dart';
import 'package:client/views/dashboard/profile/stateManagers/provider/profile_provider.dart';
import 'package:client/views/dashboard/saved/presentation/provider/provider.dart';
import 'package:client/views/review/presentation/provider/review_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<CardProvider>(create: (_) => CardProvider(inject())),
    ChangeNotifierProvider<ChatProvider>(create: (_) => ChatProvider(inject())),
    ChangeNotifierProvider<GigProvider>(create: (_) => GigProvider(inject())),
    ChangeNotifierProvider<ArtisanProvider>(
        create: (_) => ArtisanProvider(inject())),
    ChangeNotifierProvider<SaveProfileListProvider>(
        create: (_) => SaveProfileListProvider(inject())),
    ChangeNotifierProvider<ReviewProvider>(
        create: (_) => ReviewProvider(inject())),
    ChangeNotifierProvider<SavedGigListProvider>(
        create: (_) => SavedGigListProvider(inject())),
    ChangeNotifierProvider<ProfileProvider>(
        create: (_) => ProfileProvider(inject())),
    ChangeNotifierProvider<PayoutProvider>(create: (_) => PayoutProvider(inject())),
  ];
}
