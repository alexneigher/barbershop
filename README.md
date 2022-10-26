# Barbershop
A simulation of barbershop traffic

## Initial Setup

### Install dependencies
> These install instructions assume youre running this program on a mac

1. Install **Homebrew** ([Link](https://brew.sh/))
    - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

2. Install **RVM** ([Link](https://rvm.io/rvm/install)) (Or use your favorite ruby version manager)
    - `\curl -sSL https://get.rvm.io | bash`

3. Install **Ruby** ([Link](http://railsapps.github.io/installrubyonrails-mac.html))
      - `rvm install ruby-2.7.4` (or whatever version number is)
    - Set your system to use the same version of Ruby as the app (the OS may already have an older or newer version installed):
      - `rvm --default use 2.7.4`
    - Run `rvm list` to confirm that the current and default Ruby version is set to the app's version.

4. Install **Bundler** ([Link](https://bundler.io/doc/troubleshooting.html))
  - `gem install bundler`
  This will install the package manager for the gems included in this project (see `Gemfile`)

5. Run `bundle install` from the root of this directory to install the project specific dependencies

6. Execute the program by running `ruby simulation.rb`

------------------------

Example Output:
```
alexneigher@BPF-Laptop-115 barbershop % ruby simuation.rb 
[00:00:00] Customer-1 leaves disappointed
[08:59:59] Customer-2 leaves disappointed
[09:00:00] Family Cuts is open for business!
[09:00:00] Steve clocked in
[09:00:00] Sarah clocked in
[09:00:00] James clocked in
[09:00:00] Jess clocked in
[09:04:59] Customer-3 entered
[09:05:00] Steve started cutting Customer-3's hair
[09:09:59] Customer-4 entered
[09:10:00] Sarah started cutting Customer-4's hair
[09:14:59] Customer-5 entered
[09:15:00] James started cutting Customer-5's hair
[09:19:59] Customer-6 entered
[09:20:00] Jess started cutting Customer-6's hair
[09:24:59] Customer-7 entered
[09:29:59] Customer-8 entered
[09:34:59] Customer-9 entered
[09:39:59] Customer-10 entered
[09:05:00] Steve finished cutting Customer-3's hair
[09:41:04] Customer-3 leaves satisfied
[09:41:05] Steve started cutting Customer-7's hair
[09:20:00] Jess finished cutting Customer-6's hair
[09:43:33] Customer-6 leaves satisfied
[09:43:34] Jess started cutting Customer-8's hair
[09:10:00] Sarah finished cutting Customer-4's hair
[09:44:45] Customer-4 leaves satisfied
[09:44:46] Sarah started cutting Customer-9's hair
[09:44:59] Customer-11 entered
[09:15:00] James finished cutting Customer-5's hair
[09:45:46] Customer-5 leaves satisfied
[09:45:47] James started cutting Customer-10's hair
[09:49:59] Customer-12 entered
[09:54:59] Customer-13 entered
[09:59:59] Customer-14 entered
[10:04:59] Customer-11 leaves frustrated
[10:04:59] Customer-15 entered
[09:44:46] Sarah finished cutting Customer-9's hair
[10:05:43] Customer-9 leaves satisfied
[10:05:44] Sarah started cutting Customer-12's hair
[09:43:34] Jess finished cutting Customer-8's hair
[10:08:39] Customer-8 leaves satisfied
[10:08:40] Jess started cutting Customer-13's hair
[10:09:59] Customer-16 entered
[10:14:59] Customer-17 entered
[09:41:05] Steve finished cutting Customer-7's hair
[10:16:10] Customer-7 leaves satisfied
[10:16:11] Steve started cutting Customer-14's hair
[10:19:59] Customer-18 entered
[09:45:47] James finished cutting Customer-10's hair
[10:22:27] Customer-10 leaves satisfied
[10:22:28] James started cutting Customer-15's hair
[10:24:59] Customer-19 entered
[10:29:59] Customer-16 leaves frustrated
[10:29:59] Customer-20 entered
[10:05:44] Sarah finished cutting Customer-12's hair
[10:30:09] Customer-12 leaves satisfied
[10:30:10] Sarah started cutting Customer-17's hair
[10:34:59] Customer-21 entered
[10:39:59] Customer-18 leaves frustrated
[10:39:59] Customer-22 entered
[10:44:59] Customer-19 leaves frustrated
[10:44:59] Customer-23 entered
[10:08:40] Jess finished cutting Customer-13's hair
[10:45:11] Customer-13 leaves satisfied
[10:45:12] Jess started cutting Customer-20's hair
[10:49:59] Customer-24 entered
[10:16:11] Steve finished cutting Customer-14's hair
[10:54:11] Customer-14 leaves satisfied
[10:54:12] Steve started cutting Customer-21's hair
[10:54:59] Customer-25 entered
[10:22:28] James finished cutting Customer-15's hair
[10:56:41] Customer-15 leaves satisfied
[10:56:42] James started cutting Customer-22's hair
[10:59:59] Customer-26 entered
[10:30:10] Sarah finished cutting Customer-17's hair
[11:04:07] Customer-17 leaves satisfied
[11:04:08] Sarah started cutting Customer-23's hair
[11:04:59] Customer-27 entered
[11:09:59] Customer-24 leaves frustrated
[11:09:59] Customer-28 entered
[11:14:59] Customer-25 leaves frustrated
[11:14:59] Customer-29 entered
[11:19:59] Customer-26 leaves frustrated
[11:19:59] Customer-30 entered
[10:54:12] Steve finished cutting Customer-21's hair
[11:24:06] Customer-21 leaves satisfied
[11:24:07] Steve started cutting Customer-27's hair
[10:45:12] Jess finished cutting Customer-20's hair
[11:24:29] Customer-20 leaves satisfied
[11:24:30] Jess started cutting Customer-28's hair
[11:24:59] Customer-31 entered
[10:56:42] James finished cutting Customer-22's hair
[11:28:47] Customer-22 leaves satisfied
[11:28:48] James started cutting Customer-29's hair
[11:29:59] Customer-32 entered
[11:04:08] Sarah finished cutting Customer-23's hair
[11:33:53] Customer-23 leaves satisfied
[11:33:54] Sarah started cutting Customer-30's hair
[11:34:59] Customer-33 entered
[11:39:59] Customer-34 entered
[11:44:59] Customer-31 leaves frustrated
[11:44:59] Customer-35 entered
[11:24:30] Jess finished cutting Customer-28's hair
[11:48:51] Customer-28 leaves satisfied
[11:48:52] Jess started cutting Customer-32's hair
[11:49:59] Customer-36 entered
[11:54:59] Customer-33 leaves frustrated
[11:54:59] Customer-37 entered
[11:59:59] Customer-34 leaves frustrated
[11:59:59] Customer-38 entered
[11:24:07] Steve finished cutting Customer-27's hair
[12:02:31] Customer-27 leaves satisfied
[12:02:32] Steve started cutting Customer-35's hair
[12:04:59] Customer-39 entered
[11:28:48] James finished cutting Customer-29's hair
[12:07:03] Customer-29 leaves satisfied
[12:07:04] James started cutting Customer-36's hair
[11:33:54] Sarah finished cutting Customer-30's hair
[12:08:47] Customer-30 leaves satisfied
[12:08:48] Sarah started cutting Customer-37's hair
[12:09:59] Customer-40 entered
[11:48:52] Jess finished cutting Customer-32's hair
[12:13:55] Customer-32 leaves satisfied
[12:13:56] Jess started cutting Customer-38's hair
[12:14:59] Customer-41 entered
[12:19:59] Customer-42 entered
[12:24:59] Customer-39 leaves frustrated
[12:24:59] Customer-43 entered
[12:29:59] Customer-40 leaves frustrated
[12:29:59] Customer-44 entered
[12:02:32] Steve finished cutting Customer-35's hair
[12:31:02] Customer-35 leaves satisfied
[12:31:03] Steve started cutting Customer-41's hair
[12:34:59] Customer-45 entered
[12:08:48] Sarah finished cutting Customer-37's hair
[12:37:34] Customer-37 leaves satisfied
[12:37:35] Sarah started cutting Customer-42's hair
[12:39:59] Customer-46 entered
[12:13:56] Jess finished cutting Customer-38's hair
[12:40:25] Customer-38 leaves satisfied
[12:40:26] Jess started cutting Customer-43's hair
[12:07:04] James finished cutting Customer-36's hair
[12:44:41] Customer-36 leaves satisfied
[12:44:42] James started cutting Customer-44's hair
[12:44:59] Customer-47 entered
[12:49:59] Customer-48 entered
[12:54:59] Customer-45 leaves frustrated
[12:54:59] Customer-49 entered
[12:59:59] Customer-46 leaves frustrated
[12:59:59] Customer-50 entered
[13:00:00] Roger clocked in
[13:00:00] Billy clocked in
[13:00:00] Nancy clocked in
[13:00:00] Sue clocked in
[13:00:00] Roger started cutting Customer-47's hair
[13:00:01] Billy started cutting Customer-48's hair
[13:00:02] Nancy started cutting Customer-49's hair
[13:00:03] Sue started cutting Customer-50's hair
[12:37:35] Sarah finished cutting Customer-42's hair
[13:01:34] Customer-42 leaves satisfied
[13:01:35] Sarah clocked out
[12:31:03] Steve finished cutting Customer-41's hair
[13:02:38] Customer-41 leaves satisfied
[13:02:39] Steve clocked out
[13:04:59] Customer-51 entered
[13:09:59] Customer-52 entered
[13:14:59] Customer-53 entered
[12:40:26] Jess finished cutting Customer-43's hair
[13:17:18] Customer-43 leaves satisfied
[13:17:19] Jess clocked out
[13:19:59] Customer-54 entered
[12:44:42] James finished cutting Customer-44's hair
[13:24:07] Customer-44 leaves satisfied
[13:24:08] James clocked out
[13:24:59] Customer-51 leaves frustrated
[13:24:59] Customer-55 entered
[13:00:00] Roger finished cutting Customer-47's hair
[13:25:12] Customer-47 leaves satisfied
[13:25:13] Roger started cutting Customer-52's hair
[13:00:02] Nancy finished cutting Customer-49's hair
[13:25:31] Customer-49 leaves satisfied
[13:25:32] Nancy started cutting Customer-53's hair
[13:00:03] Sue finished cutting Customer-50's hair
[13:28:51] Customer-50 leaves satisfied
[13:28:52] Sue started cutting Customer-54's hair
[13:29:59] Customer-56 entered
[13:34:59] Customer-57 entered
[13:00:01] Billy finished cutting Customer-48's hair
[13:35:59] Customer-48 leaves satisfied
[13:36:00] Billy started cutting Customer-55's hair
[13:39:59] Customer-58 entered
[13:44:59] Customer-59 entered
[13:49:59] Customer-56 leaves frustrated
[13:49:59] Customer-60 entered
[13:54:59] Customer-57 leaves frustrated
[13:54:59] Customer-61 entered
[13:25:32] Nancy finished cutting Customer-53's hair
[13:58:07] Customer-53 leaves satisfied
[13:58:08] Nancy started cutting Customer-58's hair
[13:28:52] Sue finished cutting Customer-54's hair
[13:59:11] Customer-54 leaves satisfied
[13:59:12] Sue started cutting Customer-59's hair
[13:25:13] Roger finished cutting Customer-52's hair
[13:59:40] Customer-52 leaves satisfied
[13:59:41] Roger started cutting Customer-60's hair
[13:59:59] Customer-62 entered
[14:04:59] Customer-63 entered
[13:36:00] Billy finished cutting Customer-55's hair
[14:05:28] Customer-55 leaves satisfied
[14:05:29] Billy started cutting Customer-61's hair
[14:09:59] Customer-64 entered
[14:14:59] Customer-65 entered
[13:58:08] Nancy finished cutting Customer-58's hair
[14:19:04] Customer-58 leaves satisfied
[14:19:05] Nancy started cutting Customer-62's hair
[14:19:59] Customer-66 entered
[14:24:59] Customer-63 leaves frustrated
[14:24:59] Customer-67 entered
[14:05:29] Billy finished cutting Customer-61's hair
[14:27:23] Customer-61 leaves satisfied
[14:27:24] Billy started cutting Customer-64's hair
[13:59:12] Sue finished cutting Customer-59's hair
[14:28:11] Customer-59 leaves satisfied
[14:28:12] Sue started cutting Customer-65's hair
[14:29:59] Customer-68 entered
[14:34:59] Customer-69 entered
[13:59:41] Roger finished cutting Customer-60's hair
[14:35:36] Customer-60 leaves satisfied
[14:35:37] Roger started cutting Customer-66's hair
[14:39:59] Customer-70 entered
[14:19:05] Nancy finished cutting Customer-62's hair
[14:41:58] Customer-62 leaves satisfied
[14:41:59] Nancy started cutting Customer-67's hair
[14:44:59] Customer-71 entered
[14:49:59] Customer-68 leaves frustrated
[14:49:59] Customer-72 entered
[14:54:59] Customer-69 leaves frustrated
[14:54:59] Customer-73 entered
[14:59:59] Customer-70 leaves frustrated
[14:59:59] Customer-74 entered
[14:27:24] Billy finished cutting Customer-64's hair
[15:04:48] Customer-64 leaves satisfied
[15:04:49] Billy started cutting Customer-71's hair
[15:04:59] Customer-75 entered
[14:28:12] Sue finished cutting Customer-65's hair
[15:06:27] Customer-65 leaves satisfied
[15:06:28] Sue started cutting Customer-72's hair
[14:35:37] Roger finished cutting Customer-66's hair
[15:09:57] Customer-66 leaves satisfied
[15:09:58] Roger started cutting Customer-73's hair
[15:09:59] Customer-76 entered
[14:41:59] Nancy finished cutting Customer-67's hair
[15:13:30] Customer-67 leaves satisfied
[15:13:31] Nancy started cutting Customer-74's hair
[15:14:59] Customer-77 entered
[15:19:59] Customer-78 entered
[15:24:59] Customer-75 leaves frustrated
[15:24:59] Customer-79 entered
[15:29:59] Customer-76 leaves frustrated
[15:29:59] Customer-80 entered
[15:04:49] Billy finished cutting Customer-71's hair
[15:30:04] Customer-71 leaves satisfied
[15:30:05] Billy started cutting Customer-77's hair
[15:34:59] Customer-81 entered
[15:06:28] Sue finished cutting Customer-72's hair
[15:36:27] Customer-72 leaves satisfied
[15:36:28] Sue started cutting Customer-78's hair
[15:39:59] Customer-82 entered
[15:09:58] Roger finished cutting Customer-73's hair
[15:41:10] Customer-73 leaves satisfied
[15:41:11] Roger started cutting Customer-79's hair
[15:13:31] Nancy finished cutting Customer-74's hair
[15:43:27] Customer-74 leaves satisfied
[15:43:28] Nancy started cutting Customer-80's hair
[15:44:59] Customer-83 entered
[15:49:59] Customer-84 entered
[15:54:59] Customer-81 leaves frustrated
[15:54:59] Customer-85 entered
[15:36:28] Sue finished cutting Customer-78's hair
[15:56:43] Customer-78 leaves satisfied
[15:56:44] Sue started cutting Customer-82's hair
[15:59:59] Customer-86 entered
[16:04:59] Customer-83 leaves frustrated
[16:04:59] Customer-87 entered
[15:41:11] Roger finished cutting Customer-79's hair
[16:05:38] Customer-79 leaves satisfied
[16:05:39] Roger started cutting Customer-84's hair
[15:30:05] Billy finished cutting Customer-77's hair
[16:07:40] Customer-77 leaves satisfied
[16:07:41] Billy started cutting Customer-85's hair
[15:43:28] Nancy finished cutting Customer-80's hair
[16:08:02] Customer-80 leaves satisfied
[16:08:03] Nancy started cutting Customer-86's hair
[16:09:59] Customer-88 entered
[16:14:59] Customer-89 entered
[15:56:44] Sue finished cutting Customer-82's hair
[16:18:32] Customer-82 leaves satisfied
[16:18:33] Sue started cutting Customer-87's hair
[16:19:59] Customer-90 entered
[16:24:59] Customer-91 entered
[16:29:59] Customer-88 leaves frustrated
[16:29:59] Customer-92 entered
[16:34:59] Customer-89 leaves frustrated
[16:34:59] Customer-93 entered
[16:39:59] Customer-90 leaves frustrated
[16:39:59] Customer-94 entered
[16:08:03] Nancy finished cutting Customer-86's hair
[16:40:18] Customer-86 leaves satisfied
[16:40:19] Nancy started cutting Customer-91's hair
[16:05:39] Roger finished cutting Customer-84's hair
[16:40:23] Customer-84 leaves satisfied
[16:40:24] Roger started cutting Customer-92's hair
[16:07:41] Billy finished cutting Customer-85's hair
[16:41:57] Customer-85 leaves satisfied
[16:41:58] Billy started cutting Customer-93's hair
[16:44:59] Customer-95 entered
[16:49:59] Customer-96 entered
[16:54:59] Customer-97 entered
[16:18:33] Sue finished cutting Customer-87's hair
[16:55:23] Customer-87 leaves satisfied
[16:55:24] Sue started cutting Customer-94's hair
[16:59:59] Customer-98 entered
[17:04:59] Customer-95 leaves frustrated
[17:04:59] Customer-99 leaves disappointed
[16:41:58] Billy finished cutting Customer-93's hair
[17:08:46] Customer-93 leaves satisfied
[17:08:47] Billy clocked out
[17:09:59] Customer-96 leaves frustrated
[17:09:59] Customer-100 leaves disappointed
[16:40:19] Nancy finished cutting Customer-91's hair
[17:10:48] Customer-91 leaves satisfied
[17:10:49] Nancy clocked out
[16:40:24] Roger finished cutting Customer-92's hair
[17:13:14] Customer-92 leaves satisfied
[17:13:15] Roger clocked out
[17:14:59] Customer-97 leaves frustrated
[17:14:59] Customer-101 leaves disappointed
[17:19:59] Customer-98 leaves frustrated
[17:19:59] Customer-102 leaves disappointed
[17:24:59] Customer-103 leaves disappointed
[16:55:24] Sue finished cutting Customer-94's hair
[17:27:04] Customer-94 leaves satisfied
[17:27:05] Family Cuts is closed.
[17:27:05] Sue clocked out
[17:29:59] Customer-104 leaves disappointed
[17:34:59] Customer-105 leaves disappointed
[17:39:59] Customer-106 leaves disappointed
[17:44:59] Customer-107 leaves disappointed
[17:49:59] Customer-108 leaves disappointed
[17:54:59] Customer-109 leaves disappointed
[17:59:59] Customer-110 leaves disappointed
[18:04:59] Customer-111 leaves disappointed
[18:09:59] Customer-112 leaves disappointed
[18:14:59] Customer-113 leaves disappointed
[18:19:59] Customer-114 leaves disappointed
[18:24:59] Customer-115 leaves disappointed
[18:29:59] Customer-116 leaves disappointed
[18:34:59] Customer-117 leaves disappointed
[18:39:59] Customer-118 leaves disappointed
[18:44:59] Customer-119 leaves disappointed
[18:49:59] Customer-120 leaves disappointed
[18:54:59] Customer-121 leaves disappointed
[18:59:59] Customer-122 leaves disappointed
[19:04:59] Customer-123 leaves disappointed
[19:09:59] Customer-124 leaves disappointed
[19:14:59] Customer-125 leaves disappointed
[19:19:59] Customer-126 leaves disappointed
[19:24:59] Customer-127 leaves disappointed
[19:29:59] Customer-128 leaves disappointed
[19:34:59] Customer-129 leaves disappointed
[19:39:59] Customer-130 leaves disappointed
[19:44:59] Customer-131 leaves disappointed
[19:49:59] Customer-132 leaves disappointed
[19:54:59] Customer-133 leaves disappointed
[19:59:59] Customer-134 leaves disappointed
[20:04:59] Customer-135 leaves disappointed
[20:09:59] Customer-136 leaves disappointed
[20:14:59] Customer-137 leaves disappointed
[20:19:59] Customer-138 leaves disappointed
[20:24:59] Customer-139 leaves disappointed
[20:29:59] Customer-140 leaves disappointed
[20:34:59] Customer-141 leaves disappointed
[20:39:59] Customer-142 leaves disappointed
[20:44:59] Customer-143 leaves disappointed
[20:49:59] Customer-144 leaves disappointed
[20:54:59] Customer-145 leaves disappointed
[20:59:59] Customer-146 leaves disappointed
[21:04:59] Customer-147 leaves disappointed
[21:09:59] Customer-148 leaves disappointed
[21:14:59] Customer-149 leaves disappointed
[21:19:59] Customer-150 leaves disappointed
[21:24:59] Customer-151 leaves disappointed
[21:29:59] Customer-152 leaves disappointed
[21:34:59] Customer-153 leaves disappointed
[21:39:59] Customer-154 leaves disappointed
[21:44:59] Customer-155 leaves disappointed
...
...
[23:54:59] Customer-181 leaves disappointed
```
