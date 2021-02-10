// Macro for running Panda simulation  with Geant3  or Geant4 (M. Al-Turany)
// This macro is supposed to run the full simulation of the panda detector
// to run the macro:
// root  sim_complete.C  or in root session root>.x  sim_complete.C
// to run with different options:(e.g more events, different momentum, Geant4)
// root  sim_complete.C"(100, "TGeant4",2)"
#include <sys/stat.h>
int MY_sim_complete_Pi0_all(Double_t Energy, string str_hz)
{
Int_t NO_Angle = 12;
ostringstream out1,out2,out3;
out2 << NO_Angle;
out3 << fixed << setprecision(1) << Energy;
string str_NO_Angle = out2.str(), str_Energy = out3.str();
string path = "/home/jokey/Panda/data/WorkData_Pi0_AllAngle_E" +str_Energy  +"_" + str_hz;
int isCreate = ::mkdir(path.c_str(),S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO);
TString prefix = "/home/jokey/Panda/data/WorkData_Pi0_AllAngle_E" +str_Energy  +"_" + str_hz +"/evtcomplete";
Int_t nEvents = 100000;
TString SimEngine = "TGeant4";
Double_t BeamMomentum = 1.0;

Double_t t_min, t_max;
if (NO_Angle == 1) {t_min = 23.8514; t_max = 24.6978;}
if (NO_Angle == 2) {t_min = 26.4557; t_max = 27.3781;}
if (NO_Angle == 3) {t_min = 29.4579; t_max = 30.4916;}
if (NO_Angle == 4) {t_min = 32.6536; t_max = 33.7759;}
if (NO_Angle == 5) {t_min = 36.1172; t_max = 37.3507;}
if (NO_Angle == 6) {t_min = 39.9051; t_max = 41.2390;}
if (NO_Angle == 7) {t_min = 44.2385; t_max = 45.7355;}
if (NO_Angle == 8) {t_min = 48.8451; t_max = 50.4459;}
if (NO_Angle == 9) {t_min = 53.7548; t_max = 55.4790;}
if (NO_Angle == 10) {t_min = 59.0059; t_max = 60.8229;}
if (NO_Angle == 11) {t_min = 64.7855; t_max = 66.7591;}
if (NO_Angle == 12) {t_min = 70.8088; t_max = 72.8652;}
if (NO_Angle == 13) {t_min = 77.0506; t_max = 79.1942;}
if (NO_Angle == 14) {t_min = 83.4997; t_max = 85.6749;}
if (NO_Angle == 15) {t_min = 90.2068; t_max = 92.4062;}
if (NO_Angle == 16) {t_min = 96.8200; t_max = 99.0099;}
if (NO_Angle == 17) {t_min = 103.361; t_max = 105.534;}
if (NO_Angle == 18) {t_min = 109.793; t_max = 111.893;}
if (NO_Angle == 19) {t_min = 116.067; t_max = 118.019;}
if (NO_Angle == 20) {t_min = 121.838; t_max = 123.686;}
if (NO_Angle == 21) {t_min = 127.273; t_max = 129.033;}
if (NO_Angle == 22) {t_min = 132.400; t_max = 134.031;}
if (NO_Angle == 23) {t_min = 137.230; t_max = 138.679;}

ostringstream os1,os2;
os1 << fixed << setprecision(3) << t_min;
os2 << fixed << setprecision(3) << t_max;
string theta_min = os1.str(), theta_max = os2.str();
  //-----User Settings:------------------------------------------------------
  //  gDebug=5;
  TString parAsciiFile = "all.par";

  // TString inputGenerator =
  // EvtGen -> "xxxxxxxx.dec" (parses dec-file for initial particle) or "xxxxxxx.dec:initial_particle"
  // DPM    -> "dpm_xxxxx"
  // FTF    -> "ftf_xxxxx"
  // BOX    -> "box:type(pdgcode,mult):p(min,max):tht(min,max):phi(min,max)"
  // PIPI   -> "pipi:cosTheta(min,max)"
  // LEP    -> "leplep:pid(value):gegm(value):cosTheta(min,max)"
  TString inputGenerator = "box:type(111,1):p(" + str_Energy +"," + str_Energy  +"):tht(22,140):phi(0,360)";

//-------------------------------------------------------------------------
  // -----   Create the Simulation run manager ------------------------------
  PndMasterRunSim *fRun = new PndMasterRunSim();
  fRun->SetInput(inputGenerator);
  fRun->SetName(SimEngine);
  fRun->SetParamAsciiFile(parAsciiFile);
  fRun->SetNumberOfEvents(nEvents);
  fRun->SetBeamMom(BeamMomentum);
  fRun->SetStoreTraj(kTRUE);
  // -----  Initialization   ------------------------------------------------
  fRun->Setup(prefix);
  // -----   Geometry   -----------------------------------------------------
  FairModule *Cave = new PndCave("CAVE");
  Cave->SetGeometryFileName("pndcave.geo");
  fRun->AddModule(Cave);
  //-------------------------  Magnet   -----------------
  // This part is commented because the MDT geometry contains the magnet now
  // FairModule *Magnet= new PndMagnet("MAGNET");
  // Magnet->SetGeometryFileName("FullSolenoid_V842.root");
  // Magnet->SetGeometryFileName("FullSuperconductingSolenoid_v831.root");
  // fRun->AddModule(Magnet);
  //FairModule *Dipole = new PndMagnet("MAGNET");
  //Dipole->SetGeometryFileName("dipole.geo");
  //fRun->AddModule(Dipole);
  //-------------------------  Pipe     -----------------
  //FairModule *Pipe = new PndPipe("PIPE");
  //Pipe->SetGeometryFileName("beampipe_201309.root");
  //fRun->AddModule(Pipe);
  //-------------------------  STT       -----------------
  //FairDetector *Stt = new PndStt("STT", kTRUE);
  //Stt->SetGeometryFileName("straws_skewed_blocks_35cm_pipe.geo");
  //fRun->AddModule(Stt);
  //-------------------------  MVD       -----------------
  //FairDetector *Mvd = new PndMvdDetector("MVD", kTRUE);
  //Mvd->SetGeometryFileName("Mvd-2.1_FullVersion.root");
  //fRun->AddModule(Mvd);
  //-------------------------  GEM       -----------------
  //FairDetector *Gem = new PndGemDetector("GEM", kTRUE);
  //Gem->SetGeometryFileName("gem_3Stations_realistic_v2.root");
  //fRun->AddModule(Gem);
  //-------------------------  EMC       -----------------
  PndEmc *Emc = new PndEmc("EMC", kTRUE);
  Emc->SetGeometryVersion(1);
  //Emc->SetStorageOfData(kTRUE);
  Emc->SetStorageOfData(kFALSE);
  fRun->AddModule(Emc);
  //-------------------------  SCITIL    -----------------
  //FairDetector *SciT = new PndSciT("SCIT", kTRUE);
  //SciT->SetGeometryFileName("SciTil_201601.root");
  //fRun->AddModule(SciT);
  //-------------------------  DRC       -----------------
  //PndDrc *Drc = new PndDrc("DIRC", kTRUE);
  //Drc->SetGeometryFileName("dirc_e3_b3_l6_m40.root");
  //Drc->SetRunCherenkov(kFALSE);
  //fRun->AddModule(Drc);
  //-------------------------  DISC      -----------------
  //PndDsk *Dsk = new PndDsk("DSK", kTRUE);
  //Dsk->SetStoreCerenkovs(kFALSE);
  //Dsk->SetStoreTrackPoints(kFALSE);
  //fRun->AddModule(Dsk);
  //-------------------------  MDT       -----------------
  //PndMdt *Muo = new PndMdt("MDT", kTRUE);
  //Muo->SetBarrel("fast");
  //Muo->SetEndcap("fast");
  //Muo->SetMuonFilter("fast");
  //Muo->SetForward("fast");
  //Muo->SetMdtMagnet(kTRUE);
  //Muo->SetMdtCoil(kTRUE);
  //Muo->SetMdtMFIron(kTRUE);
  //fRun->AddModule(Muo);
  //-------------------------  FTS       -----------------
  //FairDetector *Fts = new PndFts("FTS", kTRUE);
  //Fts->SetGeometryFileName("fts.geo");
  //fRun->AddModule(Fts);
  //-------------------------  FTOF      -----------------
  //FairDetector *FTof = new PndFtof("FTOF", kTRUE);
  //FTof->SetGeometryFileName("ftofwall.root");
  //fRun->AddModule(FTof);
  //-------------------------  RICH       ----------------
  //PndRich *Rich = new PndRich("RICH", kTRUE);
  //Rich->SetGeometryFileName("rich_v313.root");
  //fRun->AddModule(Rich);
  // -----   Event generator   ----------------------------------------------
  fRun->SetGenerator();

  // -----   Event filter setup   -------------------------------------------
  FairFilteredPrimaryGenerator *primGen = fRun->GetFilteredPrimaryGenerator();
  primGen->SetVerbose(0);
  // ---- Example configuration for the event filter ------------------------
  // FairEvtFilterOnSingleParticleCounts* chrgFilter = new FairEvtFilterOnSingleParticleCounts("chrgFilter");
  // chrgFilter->AndMinCharge(4, FairEvtFilter::kCharged);
  // primGen->AndFilter(chrgFilter);

  // -----   Add tasks   ----------------------------------------------------
  fRun->AddSimTasks();
  // -----   Intialise and run   --------------------------------------------
  fRun->Init();
  fRun->Run(nEvents);
  fRun->Finish();
  return 0;
}
