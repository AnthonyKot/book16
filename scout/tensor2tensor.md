# Scout: tensor2tensor (tensorflow/tensor2tensor)

- **Repo:** https://github.com/tensorflow/tensor2tensor
- **Clone:** `~/book16/repos/tensor2tensor` (already present; not re-cloned). Working tree 35M; `.git` 19M.
- **History span (HEAD):** 2017-06-15T11:24:53-07:00 → 2023-04-01T03:18:41-07:00
- **Commits:** 4379 on `HEAD` / `master`; 4381 `--all` (two leftover revert branches).
- **Authors (HEAD):** T2T Team 765, Lukasz Kaiser 673, Ryan Sepassi 448, Afroz Mohiuddin 361, Piotr Kozakowski 182, Noam Shazeer 166, then a long tail that includes Niki Parmar (92) and Ashish Vaswani (57). Calendar 2018 is the peak (2228 commits); 2020 is 75; 2023 is 4.

The Transformer paper went on arXiv on 2017-06-12. This repo opens three days later. What git holds is not a conversation that invents attention — it is the export of Google Brain's already-working library, the week the internal paths leaked, the afternoon the first author of the paper reverted an attention mask because training loss had gone to zero, and then a Copybara afterlife that ends on April 1 at 03:18.

---

## 1. Day one is a one-line README; 155 seconds later the Transformer

- **Find-type:** 3 (first commit)
- **Hashes:** `cedf0e2df6c8b155856b31da58fc12b1c737e862` (empty title); `3d9c62f2aca9492db5c22676416974005b9dcbae` (the dump)
- **Dates:** 2017-06-15T11:24:53-07:00 and 2017-06-15T11:27:28-07:00
- **Author:** Ryan Sepassi `<rsepassi@google.com>` (both)
- **Messages:** `first commit` / `initial push`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor log --reverse --format='%H %ai %an %s' | head -5
git -C ~/book16/repos/tensor2tensor show --stat --format=fuller cedf0e2df6c8b155856b31da58fc12b1c737e862
git -C ~/book16/repos/tensor2tensor show --shortstat --format=fuller 3d9c62f2aca9492db5c22676416974005b9dcbae | head -12
```

```
cedf0e2df6c8b155856b31da58fc12b1c737e862 2017-06-15 11:24:53 -0700 Ryan Sepassi first commit
3d9c62f2aca9492db5c22676416974005b9dcbae 2017-06-15 11:27:28 -0700 Ryan Sepassi initial push
414cee3e216947b017a6f7535e5c8328b8ab95c2 2017-06-15 13:26:15 -0700 Lukasz Kaiser Merge pull request #1 from rsepassi/master

    first commit
 README.md | 1 +
+# tensor2tensor

    initial push
 74 files changed, 15315 insertions(+), 1 deletion(-)
```

`tensor2tensor/models/transformer.py` is 495 lines in that dump. Its docstring is not the paper title. It is:

```
"""transformer (attention).

encoder: [Self-Attention, Feed-forward] x n
decoder: [Self-Attention, Source-Target-Attention, Feed-forward] x n
"""
```

The scale factor from the paper is already there, one line, in `common_attention.py`: `q *= key_depth_per_head**-0.5`. So is `expert_utils.py` (1284 lines of sparsely-gated Mixture-of-Experts, citing an ICLR draft). `AUTHORS` lists only `Google Inc.` Vaswani, Shazeer, Parmar, Kaiser do not appear as git authors on the commit that published their model.

- **Why it is a story:** Someone at Google Brain decided the public clock should start with a titled empty repo, then, two and a half minutes later, dropped fifteen thousand lines that already knew how to train WMT English–German with `MODEL=transformer`. The paper is three days old. The code is older than the paper's public life. Day one is a press-release cut, not a genesis.
- **What the reader learns:** `git log --reverse | head` on a famous system usually shows a migration or a staging commit. The name on that dump is the person who was allowed to push, not the people who invented the file. Blame the import, then ask who is missing.
- **Surprise:** 4

---

## 2. Leakr: the first week has to erase `blaze-bin` and `learning/brain/google`

- **Find-type:** 2 (exported / reconstructed artifact)
- **Hash:** `01787ca8a53e96c56eb6826443c5a12a29e9209a`
- **Date:** 2017-06-21T12:22:25-07:00 (author); committed 14:42:53 the same day
- **Author:** Ryan Sepassi `<rsepassi@google.com>`
- **Message:** `Add leakr dictionary to prevent internal stuff leaking out` + `PiperOrigin-RevId: 159726434`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor show --format=fuller 01787ca8a53e96c56eb6826443c5a12a29e9209a
git -C ~/book16/repos/tensor2tensor log -S 'blaze-bin' --format='%h %ai %an %s'
git -C ~/book16/repos/tensor2tensor log -S 'learning/brain/google' --format='%h %ai %an %s'
```

```
AuthorDate: Wed Jun 21 12:22:25 2017 -0700
CommitDate: Wed Jun 21 14:42:53 2017 -0700
    Add leakr dictionary to prevent internal stuff leaking out
    PiperOrigin-RevId: 159726434
 2 files changed, 1 insertion(+), 3 deletions(-)

-./blaze-bin/third_party/py/tensor2tensor/data_generators/replace_oov \
+$BINARYDIR/replace_oov \
-      (see learning/brain/google/python/ops/candidate_sampling.py)
```

The paths were in the June 15 dump. Six days of public git carried Google's Blaze output directory and a file under `learning/brain/google`. The commit *message* talks about adding a leakr dictionary; the public diff is only the cleanup. The dictionary itself stayed inside.

- **Why it is a story:** They knew, by day six, that exporting Piper to GitHub was a leaky pipe. Someone ran leakr, two comments and one command path were redacted, and from then on almost every interesting commit wears a `PiperOrigin-RevId`. The public history is a projection. The first week is the week they learned that the projection showed the office.
- **What the reader learns:** `git log -S` for your own internal path fragments (`blaze-bin`, `//depot`, `go/`, `PiperOrigin`) is how you find the import boundary. A commit that claims to add a filter and only deletes two strings is the filter working — and proof it was needed.
- **Surprise:** 4

---

## 3. Ashish Vaswani reverts attention that was peeking into the future

- **Find-type:** 7 (feature that became the vulnerability)
- **Hashes:** `2ced78dbb2a9bb921ebd3e327c704efb790dc140` (look_right arrives); `a0bd0177bf766c953041b7451398ab1791adb1e5` (the revert)
- **Dates:** 2017-08-01T11:08:24+01:00 and 2017-08-04T14:41:57-07:00
- **Authors:** William `<awwoof@hotmail.com>`; Ashish Vaswani `<avaswani@google.com>`
- **Messages:** `Unify methods and started work on Bias` / `Reverted back to the previous masked_local_attention_1d because the current one was giving 0 losses indicating that it was peeking into the future. ...`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor log -S 'look_right' --format='%h %ai %an %s' -- '*.py'
git -C ~/book16/repos/tensor2tensor show --stat --format=fuller a0bd0177bf766c953041b7451398ab1791adb1e5 | head -20
```

```
37e7dedf 2017-07-28 14:06:55 +0100 William Updated sliding window
2ced78db 2017-08-01 11:08:24 +0100 William Unify methods and started work on Bias
33d47f0a 2017-07-27 23:46:12 -0700 Niki Parmar Add tests for dot product and local unmasked attention
75270907 2017-08-01 18:03:10 -0700 Lukasz Kaiser More WMT corrections, port image problems to Problem.
a0bd0177 2017-08-04 14:41:57 -0700 Ashish Vaswani Reverted back to the previous masked_local_attention_1d because the current one was giving 0 losses indicating that it was peeking into the future. The way the attention bias was being added also seemed wrong. Renamed unmasked_local_attention_1d to local_attention_1d. The user can specify local_attention_1d if they want to look left and right of the query block.

    PiperOrigin-RevId: 164312109
 tensor2tensor/layers/common_attention.py      | 132 +++++++++++---------------
 2 files changed, 57 insertions(+), 79 deletions(-)
```

The buggy signature defaulted `look_right=True` on a function named `masked_local_attention_1d`. The paper's first author puts the causal mask back by deleting that parameter.

- **Why it is a story:** For three days the library that taught the world "attention is all you need" would train a local-attention variant to zero loss because the mask looked right. Nobody needed a paper review. The loss told on them. Vaswani, six weeks after the arXiv date, writes the sentence into git so the next person will not have to rediscover it.
- **What the reader learns:** A 0.0 training loss on an autoregressive model is not a miracle; it is leakage. `git log -S` on the name of a safety flag (`look_right`, `mask_future`, `causal`) finds the moment the safety was bargained away. The person who reverts a mask is often the person who knows what the mask was for.
- **Surprise:** 5

---

## 4. One character in the sinusoid, every checkpoint in the world

- **Find-type:** 1 (tiny diff, huge blast radius) and 8 (rollback of the world)
- **Hashes:** `e3e54900d377940c2930285104d6b05bf7cf0330` (PR #1758); `e4ea462e73388b6c8a2ea99a5d92aacd9c3237c5` (the rollback)
- **Dates:** 2019-12-12T16:20:46+08:00 and 2019-12-21T20:59:49-08:00
- **Authors:** geek_fly `<real.szf@gmail.com>`; T2T Team `<no-reply@google.com>` via Copybara
- **Messages:** `inaccurate calculation of first token in pos_emb (#1758)` / `*** Reason for rollback *** This change will break existing checkpoints in a hard to debug, hard to notice manner. Existing checkpoints will still load and run, but produce entirely incorrect results.`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor show e3e54900d377940c2930285104d6b05bf7cf0330 -- tensor2tensor/layers/common_attention.py
git -C ~/book16/repos/tensor2tensor show --format=fuller e4ea462e73388b6c8a2ea99a5d92aacd9c3237c5
```

```
-  position = tf.to_float(tf.range(length) + start_index)
+  position = tf.to_float(tf.range(1, 1+length) + start_index)

    *** Reason for rollback ***
    This change will break existing checkpoints in a hard to debug, hard to notice manner.
    Existing checkpoints will still load and run, but produce entirely incorrect results.
    PiperOrigin-RevId: 286760574
 tensor2tensor/layers/common_attention.py | 2 +-
```

The PR is mathematically sincere: position 0 makes `sin(0)=0` and `cos(0)=1`, so the first token's timing signal is half zeros and half ones. The paper's own formula starts at 0. Nine days later Google rolls the one-liner back, not because it is wrong in a vacuum, but because every trained Transformer checkpoint in the wild assumed the "wrong" zeros.

- **Why it is a story:** A contributor read the sinusoids, saw a zero, and "fixed" the most famous positional encoding in deep learning. For nine days HEAD would load an old checkpoint and silently emit garbage. The rollback message is the whole lesson of shipping math: the trained weights *are* the spec.
- **What the reader learns:** A 2-line diff on a function every model calls is a weapon. Compatibility is not comments; it is "will this still decode the checkpoints people already paid to train?" Search `Reason for rollback` and `break existing checkpoints` in any research repo.
- **Surprise:** 5

---

## 5. `TODO(noam): ask rsepassi for help here`

- **Find-type:** 5 (comment that outlived its code — and both people)
- **Hash:** `6d9274e1234cebf8fcde1e7f7fec85a4099d0588`
- **Date:** 2018-04-15T23:19:49-07:00 (Sunday night); committed 2018-04-20 by Ryan Sepassi
- **Author:** Noam Shazeer `<noam@google.com>`
- **Message:** `Improvements to bfloat16 weights option.`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor log -S 'ask rsepassi' --format='%H %ai %an %s'
git -C ~/book16/repos/tensor2tensor blame -L 250,255 tensor2tensor/bin/t2t_trainer.py
git -C ~/book16/repos/tensor2tensor log --author='Sepassi' -1 --format='%ai %an %s'
git -C ~/book16/repos/tensor2tensor log --author='Shazeer' -1 --format='%ai %an %s'
```

```
6d9274e1234cebf8fcde1e7f7fec85a4099d0588 2018-04-15 23:19:49 -0700 Noam Shazeer Improvements to bfloat16 weights option.

6d9274e12 (Noam Shazeer  2018-04-15 23:19:49 -0700 250)   # the various custom getters we have written do not play well together yet.
6d9274e12 (Noam Shazeer  2018-04-15 23:19:49 -0700 251)   # TODO(noam): ask rsepassi for help here.

2019-03-07 10:29:13 -0800 Ryan Sepassi Update trax_test to test_train_eval_predict
2019-09-12 21:27:59 -0700 Noam Shazeer increase window size of partially-built sequences in c++ packing op ...
```

The same TODO is still on `HEAD` in `t2t_trainer.py:251` and `t2t_attack.py:98`. Sepassi's last commit is 2019-03-07. Shazeer's last is 2019-09-12. The daisy-chain / custom-getter collision was never resolved in this tree.

- **Why it is a story:** On a Sunday night in April 2018, the co-inventor of the Transformer writes himself a reminder to ask the engineer who actually ships the repo. He does not ask in the commit. He leaves a note. The engineer later commits the note, then leaves the project. The note is still there in 2023, under a copyright line that Copybara bumped to "2023 The Tensor2Tensor Authors" while no paper author still commits.
- **What the reader learns:** `git blame` on TODOs that name a person is a social graph. When both names have left `git shortlog` and the line remains, the comment has outlived the organization that could have acted on it.
- **Surprise:** 4

---

## 6. Copybara stamps a December 2018 commit with a December 2019 author date

- **Find-type:** 2 (planted / dated / faked artifact)
- **Hash:** `2451614b930c73b2b8dd891b4fc5838d99a151a6`
- **Dates:** AuthorDate 2019-12-30T03:29:33-08:00; CommitDate 2018-12-30T03:30:14-08:00 (author is 365 days *after* the commit)
- **Author:** Keyon Vafa `<vafa@google.com>`; committer Copybara-Service
- **Message:** `Add SinkhornAutoregressiveFlow to learn permutation discrete flow transformation instead of loc-scale.` + `PiperOrigin-RevId: 227275364`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor log --format='%at %ct %H %ai %ci %an %s' \
  | awk '{g=$2-$1; if (g<-3600) printf "%8.1fh %s author=%s commit=%s %s\n", g/3600,$3,$4,$7,substr($0,index($0,$10))}'
git -C ~/book16/repos/tensor2tensor show --format=fuller --stat 2451614b930c73b2b8dd891b4fc5838d99a151a6 | head -16
```

```
 -8760.0h  2451614b930c73b2b8dd891b4fc5838d99a151a6  author=2019-12-30 commit=2018-12-30  Keyon Vafa Add SinkhornAutoregressiveFlow ...
 -8458.1h  a84f42507a2d588891e355f8bac74276d0baed54  author=2018-12-31 commit=2018-01-12  T2T Team Introduces fixes to get VQ-VAE working.

AuthorDate: Mon Dec 30 03:29:33 2019 -0800
CommitDate: Sun Dec 30 03:30:14 2018 -0800
    PiperOrigin-RevId: 227275364
```

Neighboring Piper ids `227918987`–`227927931` land on 2019-01-04. So 227275364 is late December **2018**. The commit date is right; the author date rolled the year forward. A sibling bug, `a84f42507a2d588891e355f8bac74276d0baed54`, authors a VQ-VAE fix on 2018-12-31 and commits it on 2018-01-12 (Piper 180425931, which sits with Christmas-2017 work exported in mid-January). Two New Year's Eves, two off-by-one-year stamps, both at 03:00-ish.

- **Why it is a story:** Nobody forged a 1970 epoch. The export machinery blinked at the year boundary and produced a commit that was authored in the future. `git log` by author date would file SinkhornAutoregressiveFlow with 2019's Christmas; `git log` by commit date files it with 2018's. The Piper id is the tie-breaker the public metadata does not explain.
- **What the reader learns:** Always print `%ai` and `%ci` together, then subtract. A 8760-hour gap on December 30 is a year-rollover, not time travel. Internal-export repos accumulate these; they are not planted mythology, they are clock bugs with a receipt.
- **Surprise:** 4

---

## 7. The paper authors type, then they stop; `T2T Team` keeps the lights on

- **Find-type:** 4 (name that disappears / appears)
- **Hashes (anchors):** first Shazeer `a8463f53b76847f5692d9acf64914d5285b7214d`; last Vaswani `e26510c13a5d2a1ce6e6de3afd3ab4148f1283aa`; last Shazeer `f23d147ef8910c94caf982c387ae2ecc122b2cdd`; last Sepassi `8de05840752a44ea472adf027aed88696c69216d`; last Kaiser `302a04f0e47252458984a7b3fb95057792a06f9a`; last commit `bafdc1b67730430d38d6ab802cbd51f9d053ba2e`
- **Dates:** 2017-06-21 → 2019-03-21 (Vaswani) → 2019-09-12 (Shazeer) → 2020-06-27 (Kaiser, and he uses the same commit to write "deprecated") → 2023-04-01 03:18 (Copybara copyright bump)
- **Authors:** see windows below
- **Messages:** first real model tweak is Shazeer's `Added parameter-attention option to transformer model.` Last human paper-author commit is Kaiser changing "maintenance mode" to "deprecated". Last commit of the repo is `Internal change` that replaces `Copyright 2022` with `Copyright 2023` across the tree.
- **Command:**

```
git -C ~/book16/repos/tensor2tensor shortlog -sn | head -12
git -C ~/book16/repos/tensor2tensor log --format='%ad' --date=format:%Y | sort | uniq -c
git -C ~/book16/repos/tensor2tensor log --author='Vaswani' --reverse --format='%ai %s' | head -1
git -C ~/book16/repos/tensor2tensor log --author='Vaswani' -1 --format='%ai %s'
git -C ~/book16/repos/tensor2tensor log --author='Shazeer' -1 --format='%ai %s'
git -C ~/book16/repos/tensor2tensor log --author='Kaiser' -1 --format='%ai %s'
```

```
   765  T2T Team
   673  Lukasz Kaiser
   448  Ryan Sepassi
   361  Afroz Mohiuddin
   166  Noam Shazeer
    92  Niki Parmar
    57  Ashish Vaswani
    30  Aidan Gomez

   850 2017
  2228 2018
  1192 2019
    75 2020
    16 2021
    14 2022
     4 2023
```

Jakob Uszkoreit, Illia Polosukhin, and Llion Jones never appear. `T2T Team <no-reply@google.com>` is a Copybara mask that starts 2017-07-14 and authors the last commit.

- **Why it is a story:** The names the field recites (Vaswani, Shazeer, Kaiser, Parmar, Gomez) are real committers here, for two years, and then they are not. The org chart that replaces them is a mailing list that cannot reply. Kaiser's last act is to demote the library he opened. Three years of copyright-year automation follow.
- **What the reader learns:** Year-window `shortlog` is the succession document. A 2228-commit year followed by a 4-commit year is not "mature"; it is a museum with the lights still on a timer.
- **Surprise:** 3

---

## 8. Revert of revert of prepend-mode decoding, same Thursday

- **Find-type:** 6 (revert war)
- **Hashes:** `c825d126643d1c8864d43d828df0e7a868eaa180` (#1726); `b84d5e8f88c7465e6cbf6a86ade049b9011f98fd` (#1749 revert); `c57ccbb93c692a9d1cc36daf525a45055fe3fbc4` (#1750 revert of revert)
- **Date:** 2019-11-21, 09:58 / 10:21 / 12:10 Pacific
- **Authors:** Seppo Enarvi `<seppo.git@marjaniemi.com>`; Afroz Mohiuddin `<afrozm@google.com>` (both reverts)
- **Messages:** `Fix decoding in prepend mode (#1726)` / `Revert "Fix decoding in prepend mode (#1726)" (#1749)` / `Revert "Revert "Fix decoding in prepend mode (#1726)" (#1749)" (#1750)`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor log --grep=1726 --format='%h %ai %an %s'
git -C ~/book16/repos/tensor2tensor branch -a | grep revert
git -C ~/book16/repos/tensor2tensor show --stat --format='%h %s' b84d5e8f88c7465e6cbf6a86ade049b9011f98fd c57ccbb93c692a9d1cc36daf525a45055fe3fbc4
```

```
c825d126 2019-11-21 18:58:13 +0100 Seppo Enarvi Fix decoding in prepend mode (#1726)
b84d5e8f 2019-11-21 10:21:28 -0800 Afroz Mohiuddin Revert "Fix decoding in prepend mode (#1726)" (#1749)
c57ccbb9 2019-11-21 12:10:10 -0800 Afroz Mohiuddin Revert "Revert "Fix decoding in prepend mode (#1726)" (#1749)" (#1750)

  remotes/origin/revert-1726-master
  remotes/origin/revert-1749-revert-1726-master
```

The original fix is 22 insertions: save inputs as `partial_targets` when `prepend_mode != none`, and tile those targets as `(batch, beam)` instead of `(beam, batch)`. Afroz reverts it, then 109 minutes later reverts his revert. The leftover branches are still on the remote.

- **Why it is a story:** A community decoding bug (beam search × prepend) is merged, yanked, and restored before lunch by the same maintainer. The rule being enforced is not "never take outside PRs"; it is "the default branch may not stay broken for an afternoon." The branch names `revert-1749-revert-1726-master` are the fossil of that afternoon.
- **What the reader learns:** A revert-of-revert is often the maintainer arguing with CI, not with the contributor. Leave the revert branches; they are the minutes of the meeting. Two hours is a short revert war. It is still a war.
- **Surprise:** 3

---

## 9. Fifteen days after launch, Shazeer breaks every vocabulary on purpose

- **Find-type:** 8 (rollback of the world — a compatibility fire)
- **Hash:** `98be8128078b8a8da34271eea60ad88f879389d7`
- **Date:** 2017-06-30T14:41:03-07:00; committed 2017-07-01 by lukaszkaiser
- **Author:** Noam Shazeer `<noam@google.com>`
- **Message:** `Fix subword_text_tokenizer to make it invertible again.   This breaks existing models and vocabularies.  Change criteria for which characters are parts of words and which are separators - we now consider unicode letters and numbers to be parts of words.`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor show --stat --format=fuller 98be8128078b8a8da34271eea60ad88f879389d7 | head -22
```

```
AuthorDate: Fri Jun 30 14:41:03 2017 -0700
CommitDate: Sat Jul 1 15:16:48 2017 -0700
    Fix subword_text_tokenizer to make it invertible again.   This breaks existing models and vocabularies.
    PiperOrigin-RevId: 160690718
 tensor2tensor/data_generators/text_encoder.py      | 207 +++++++++++++--------
 tensor2tensor/data_generators/tokenizer.py         |  84 +++------
 4 files changed, 171 insertions(+), 151 deletions(-)
```

Word characters stop being "not punctuation" and become "unicode letters and numbers." Invertibility is restored. Every 32k vocab trained in the first two weeks of T2T is now a museum piece.

- **Why it is a story:** The library is sixteen days old and already has users. Shazeer chooses invertibility over those users and writes the cost into the commit subject. This is the opposite of dig 4: there, compatibility won; here, correctness won, and the sentence "This breaks existing models" is the apology and the patch notes.
- **What the reader learns:** The same project will pick opposite sides of the compatibility fight depending on how young the weights are. Read subjects that contain `breaks existing`. They are the real changelog.
- **Surprise:** 3

---

## 10. Trax is born inside T2T, then T2T is told to point at Trax

- **Find-type:** 4 (name / project that appears, then the parent is written out)
- **Hashes:** `6c7c601b8c4429dcc81ab3ec828daddea5ff2b67` (Trax deleted from this tree); `f7d93b76d931e1a8a7cf9953a71db1d89bec3ab3` (README: maintenance mode); `302a04f0e47252458984a7b3fb95057792a06f9a` (README: deprecated — Kaiser's last commit)
- **Dates:** 2019-10-05; 2019-11-17; 2020-06-27T02:08:07-07:00
- **Authors:** Afroz Mohiuddin; Lukasz Kaiser; Lukasz Kaiser
- **Messages:** `Move Trax out of T2T into its own repo.` / `More work on Trax imports: add optimizers and Trainer.` / `Use separate markers for cached weights/state ...`
- **Command:**

```
git -C ~/book16/repos/tensor2tensor show --stat --format=fuller 6c7c601b8c4429dcc81ab3ec828daddea5ff2b67 | head -18
git -C ~/book16/repos/tensor2tensor log -S 'successor library' --format='%h %ai %an %s' -- README.md
git -C ~/book16/repos/tensor2tensor show 302a04f0e47252458984a7b3fb95057792a06f9a -- README.md | head -20
```

```
    Move Trax out of T2T into its own repo.
    PiperOrigin-RevId: 273078371
 tensor2tensor/trax/README.md                       |   65 -
 tensor2tensor/trax/backend.py                      |  308 -----
 ... dozens of gin configs for Reformer and TransformerLM ...

f7d93b76 2019-11-17 18:41:35 -0800 Lukasz Kaiser More work on Trax imports: add optimizers and Trainer.
302a04f0 2020-06-27 02:08:07 -0700 Lukasz Kaiser Use separate markers ...

-of users. It is now in maintenance mode &mdash; we keep it running and welcome
+of users. It is now deprecated &mdash; we keep it running and welcome
```

- **Why it is a story:** The successor is not a rival that wins. It is a subdirectory that grows a JAX Transformer, gets extracted on a Saturday, and six weeks later the parent README is rewritten to send readers away. Kaiser's last commit, at 02:08 on a Saturday in 2020, changes one word: maintenance → deprecated. After that the repo's job is copyright years.
- **What the reader learns:** A project can die in the README of a commit whose subject is about something else. `git log -S 'deprecated' -- README.md` is the obituary search. Extraction commits (`Move X out of Y`) are the birth certificates of the next tree.
- **Surprise:** 3

---

## Ranked top-3

1. **Vaswani reverts future-peeking attention** (dig 3) — the paper's first author, a 0.0 loss, a mask named `look_right`. Type 7, surprise 5.
2. **The one-line sinusoid that would have poisoned every checkpoint** (dig 4) — `tf.range(length)` vs `tf.range(1, 1+length)`, rolled back nine days later with a message that is a textbook. Types 1+8, surprise 5.
3. **The 155-second Transformer** (dig 1) — `# tensor2tensor`, then 15,315 lines, three days after the paper, under a name that is not on the paper. Type 3, surprise 4.

## Disappointing

The original `transformer.py` never says "Attention Is All You Need"; the title arrives five days later in a README walkthrough (`192e90f9`, 2017-06-20), and after 2019 the history is mostly Copybara `Internal change` / copyright bumps — 4 commits in 2023, the last of them at 03:18 on April 1.
