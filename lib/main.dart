import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mcss/app.dart';
import 'package:mcss/app_logger.dart';
import 'package:mcss/bloc/category_bloc/category_bloc.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_bloc.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_bloc.dart';
import 'package:mcss/bloc/simple_bloc_delegate.dart';
import 'package:mcss/config.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/services/mc_server_service.dart';
import 'package:mcss/services/mojang_server_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppLogger.init();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final mcServerService = McServerService();
  final mojangServerService = MojangServerService();

  if (Config.debug) {
    await mcServerService.deleteServers();
    await mcServerService.saveServers(defaultServers);
  }

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: mcServerService),
        Provider.value(value: mojangServerService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
            create: (BuildContext context) => CategoryBloc(),
          ),
          BlocProvider<McServerDetailBloc>(
            create: (BuildContext context) => McServerDetailBloc(),
          ),
          BlocProvider<McServerListBloc>(
            create: (BuildContext context) => McServerListBloc(
              mcServerService: mcServerService,
              categoryBloc: BlocProvider.of<CategoryBloc>(context),
            ),
          ),
          BlocProvider<MojangServerListBloc>(
            create: (BuildContext context) => MojangServerListBloc(
              mojangServerService: mojangServerService,
              categoryBloc: BlocProvider.of<CategoryBloc>(context),
            ),
          ),
        ],
        child: App(),
      ),
    ),
  );
}

final defaultServers = [
  McServer('hub.mcs.gg', 25565),
  McServer('mc.mythcraft.gg', 25565),
  McServer('grmpixelmon.com', 25565),
  McServer('one.lemoncloud.net', 25565),
  McServer('play.extremecraft.net', 25565),
  McServer('play.cubecraft.net', 25565),
  McServer('pvpwars.net', 25565),
  McServer('Play.datblock.com', 25565),
  McServer('mccentral.org', 25565),
  McServer('org.archonhq.net', 25565),
  McServer('play.loverfella.com', 25565),
  McServer('play.mineheroes.org', 25565),
  McServer('play.mc-blaze.com', 25565),
  McServer('one.lemoncloud.net', 25565),
  McServer('mc-gtm.net', 25565),
  McServer('mc.gamster.org', 25565),
  McServer('join.manacube.net', 25565),
  McServer('us.mineplex.com', 25565),
  McServer('play.thedestinymc.com', 25565),
  McServer('play.vulengate.com', 25565),
  McServer('mc.snapcraft.net', 25565),
  McServer('play.hoaxmc.com', 25565),
  McServer('mc.performium.net', 25565),
  McServer('mc.hypixel.net', 25565),
  McServer('play.skyblocknetwork.com', 25565),
  McServer('play.rinaorc.com', 25565),
  McServer('play.creativefun.net', 25565),
  McServer('mc.vanitymc.co', 25565),
  McServer('mc.minebox.es', 25565),
  McServer('org.AspiriaMc.com', 25565),
  McServer('play.vipermc.net', 25565),
  McServer('org.desteria.net', 25565),
  McServer('arefy.net', 25565),
  McServer('play.opblocks.com', 25565),
  McServer('omegacraft.cl', 25565),
  McServer('mc.vortexpvp.gg', 25565),
  McServer('mso.theseedmc.com', 25565),
  McServer('mc.jailbreakmc.com', 25565),
  McServer('faithfulmc.com', 25565),
  McServer('play.pixelmonrealms.com', 25565),
  McServer('Play.pokegalaxia.com', 25565),
  McServer('mc.gamesmadeinpola.com', 25565),
  McServer('FadeCloud.com', 25565),
  McServer('join.mineville.org', 25565),
  McServer('play.simplesurvival.gg', 25565),
  McServer('mc.ventureland.net', 25565),
  McServer('join.insanitycraft.net', 25565),
  McServer('play.becto.net', 25565),
  McServer('mc.pvplab.net', 25565),
  McServer('play.alttd.com', 25565),
  McServer('pokecentral.org', 25565),
  McServer('play.pokeverse.org', 25565),
  McServer('play.craftadia.com', 25565),
  McServer('mc.detox.gg', 25565),
  McServer('hub.treemc.net', 25565),
  McServer('mc.lotc.co', 25565),
  McServer('play.mineraze.net', 25565),
  McServer('play.fluxpvp.net', 25565),
  McServer('fun.multyplay.ro', 25565),
  McServer('mc.beanblockz.com', 25565),
  McServer('munchymc.com', 25565),
  McServer('play.ham5teak.xyz', 25565),
  McServer('play.potterworldmc.com', 25565),
  McServer('pixel.rc-gamers.com', 25565),
  McServer('play.breakdowncraft.com', 25565),
  McServer('play.poke-brawl.com', 25565),
  McServer('bulk.play-ml.ru', 25565),
  McServer('play.pokedash.org', 25565),
  McServer('minesaga.org', 25565),
  McServer('play.ggmc.me', 25565),
  McServer('play.cultivatemc.com', 25565),
  McServer('play.mcatlas.net', 25565),
  McServer('mc.pvpbulgaria.eu', 25565),
  McServer('play.koronakraft.com', 25565),
  McServer('play.pokerivals.com', 25565),
  McServer('play.mc-pgst.tw', 25565),
  McServer('Play.RoyalLegacy.Net', 25565),
  McServer('bartyrealms.com', 25565),
  McServer('play.skyrealms.games', 25565),
  McServer('grmpixelmon.com', 25565),
  McServer('play.mc-drugs.com', 25565)
];
