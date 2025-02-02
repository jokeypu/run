// Macro for running Panda digitization tasks
// to run the macro:
// root  digi_complete.C  or in root session root>.x  digi_complete.C
int pid_complete(Int_t nEvents = 0, TString prefix = "../data/evtcomplete")
{
  //-----User Settings:------------------------------------------------------
  TString parAsciiFile = "all.par";
  TString input = "psi2s_Jpsi2pi_Jpsi_mumu.dec";
  TString output = "pid";
  TString friend1 = "sim";
  TString friend2 = "reco";
  TString friend3 = "digi";
  TString friend4 = "";
  TString fOptions = "";

  // -----   Initial Settings   --------------------------------------------
  PndMasterRunAna *fRun = new PndMasterRunAna();
  fRun->SetInput(input);
  fRun->SetOutput(output);
  fRun->AddFriend(friend1);
  fRun->AddFriend(friend2);
  fRun->AddFriend(friend3);
  fRun->AddFriend(friend4);
  fRun->SetParamAsciiFile(parAsciiFile);
  fRun->Setup(prefix);

  FairGeane *Geane = new FairGeane();
  fRun->AddTask(Geane);

  PndPidCorrelator *corr = NULL;
  fRun->AddTask(corr = new PndPidCorrelator());
  if ((!fOptions.Contains("day1")) || (fOptions.Contains("gem"))) {
    if (fOptions.Contains("filtered")) {
      corr->SetBarrelTrackBranch("SttMvdGemGenTrack_filtered");
    } else {
      corr->SetBarrelTrackBranch("SttMvdGemGenTrack");
    }
    //      corr->SetInputIDBranch("SttMvdGemGenTrackID");
  } else {
    if (fOptions.Contains("filtered")) {
      corr->SetBarrelTrackBranch("SttMvdGenTrack_filtered");
    } else {
      corr->SetBarrelTrackBranch("SttMvdGenTrack");
    }
    //      corr->SetInputIDBranch("SttMvdGenTrackID");
  }
  corr->SetForwardTrackBranch("FtsIdealGenTrack");
  //  corr->SetInputIDBranch2("FtsIdealGenTrackID");
  corr->SetDebugMode(kTRUE);
  // corr->SetFast(kTRUE);
  // corr->SetBackPropagate(kFALSE);

  // -----   Bremsstrahlung Correction ----------------------
  fRun->AddTask(new PndPidBremCorrector());

  // -----   MC Cloner   ------------------------------------
  //  PndMcCloner *clone = NULL;
  //  fRun->AddTask(clone = new PndMcCloner());
  // Option to clean the MCTrack TClonesArray from particles which were not interacting with sensitive detectors
  // clone->SetCleanMc();

  // -----   Classifiers   ----------------------------------
  fRun->AddTask(new PndPidIdealAssociatorTask());
  fRun->AddTask(new PndPidMvdAssociatorTask());
  fRun->AddTask(new PndPidMdtHCAssociatorTask());
  fRun->AddTask(new PndPidDrcAssociatorTask());

  if ((!fOptions.Contains("day1")) || (fOptions.Contains("gem"))) {
    fRun->AddTask(new PndPidDiscAssociatorTask());
  }

  fRun->AddTask(new PndPidSttAssociatorTask());

  fRun->AddTask(new PndPidEmcBayesAssociatorTask());

  fRun->AddTask(new PndPidSciTAssociatorTask());

  fRun->AddTask(new PndPidFtofAssociatorTask());

  if ((!fOptions.Contains("day1"))) {
    fRun->AddTask(new PndPidRichAssociatorTask());
  }

  // -----   Intialise and run   --------------------------------------------
  PndEmcMapper::Init(1);
  fRun->Init();
  fRun->Run(0, nEvents);
  fRun->Finish();
  return 0;
}
