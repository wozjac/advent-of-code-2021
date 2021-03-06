CLASS lcl_sample_data DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA:
      drawings TYPE zcl_advent_day_4=>drawings,
      boards   TYPE zcl_advent_day_4=>boards.

    CLASS-METHODS class_constructor.
ENDCLASS.



CLASS lcl_sample_data IMPLEMENTATION.

  METHOD class_constructor.

    " From https://adventofcode.com/2021/day/4/input
    drawings = VALUE #(
      ( 50 ) ( 68 ) ( 2 ) ( 1 ) ( 69 ) ( 32 ) ( 87 ) ( 10 ) ( 31 ) ( 21 ) ( 78 ) ( 23 ) ( 62 ) ( 98 )
      ( 16 ) ( 99 ) ( 65 ) ( 35 ) ( 27 ) ( 96 ) ( 66 ) ( 26 ) ( 74 ) ( 72 ) ( 45 ) ( 52 ) ( 81 ) ( 60 )
      ( 38 ) ( 57 ) ( 54 ) ( 19 ) ( 18 ) ( 77 ) ( 71 ) ( 29 ) ( 51 ) ( 41 ) ( 22 ) ( 6 ) ( 58 ) ( 5 ) ( 42 )
      ( 92 ) ( 85 ) ( 64 ) ( 94 ) ( 12 ) ( 83 ) ( 11 ) ( 17 ) ( 14 ) ( 37 ) ( 36 ) ( 59 ) ( 33 ) ( 0 ) ( 93 )
      ( 34 ) ( 70 ) ( 97 ) ( 7 ) ( 76 ) ( 20 ) ( 3 ) ( 88 ) ( 43 ) ( 47 ) ( 8 ) ( 79 ) ( 80 ) ( 63 ) ( 9 ) ( 25 )
      ( 56 ) ( 75 ) ( 15 ) ( 4 ) ( 82 ) ( 67 ) ( 39 ) ( 30 ) ( 89 ) ( 86 ) ( 46 ) ( 90 ) ( 48 ) ( 73 ) ( 91 )
      ( 55 ) ( 95 ) ( 28 ) ( 49 ) ( 61 ) ( 44 ) ( 84 ) ( 40 ) ( 53 ) ( 13 ) ( 24 )
    ).

    boards = VALUE #(
      ( VALUE #(
        ( VALUE #( (  38 ) ( 80 ) ( 23 ) ( 60 ) ( 82 ) ) )
        ( VALUE #( (  25 ) ( 35 ) ( 28 ) ( 47 ) ( 39 ) ) )
        ( VALUE #( (  40 )  ( 0 ) ( 30 ) ( 48 ) ( 76 ) ) )
        ( VALUE #( (  32 ) ( 41 ) ( 49 ) ( 69 )  ( 4 ) ) )
        ( VALUE #( (  13 ) ( 42 ) ( 89 ) ( 20 ) ( 12 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  76 ) ( 89 ) ( 13 )  ( 5 ) ( 98 ) ) )
        ( VALUE #( (  87 ) ( 48 )  ( 2 ) ( 59 ) ( 20 ) ) )
        ( VALUE #( (  37 ) ( 88 ) ( 41 ) ( 24 ) ( 57 ) ) )
        ( VALUE #( (  16 ) ( 85 ) ( 31 ) ( 73 ) ( 95 ) ) )
        ( VALUE #( (  70 ) ( 11 ) ( 93 ) ( 30 ) ( 27 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  81 ) ( 55 ) ( 41 ) ( 85 ) ( 33 ) ) )
        ( VALUE #( (  67 ) ( 97 ) ( 71 ) ( 90 ) ( 52 ) ) )
        ( VALUE #( (  19 )  ( 3 ) ( 79 ) ( 66 ) ( 14 ) ) )
        ( VALUE #( (  49 ) ( 96 ) ( 94 ) ( 26 ) ( 25 ) ) )
        ( VALUE #( (  60 ) ( 46 ) ( 51 ) ( 82 )  ( 9 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  33 ) ( 60 ) ( 26 ) ( 83 ) ( 21 ) ) )
        ( VALUE #( (  91 )  ( 7 ) ( 39 ) ( 19 ) ( 41 ) ) )
        ( VALUE #( (  88 )  ( 9 ) ( 82 ) ( 69 ) ( 29 ) ) )
        ( VALUE #( (  93 ) ( 79 ) ( 12 ) ( 34 ) ( 11 ) ) )
        ( VALUE #( (  43 ) ( 65 ) ( 64 ) ( 54 ) ( 20 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  55 ) ( 75 ) ( 71 ) ( 30 ) ( 14 ) ) )
        ( VALUE #( (  42 ) ( 67 )  ( 3 ) ( 73 ) ( 13 ) ) )
        ( VALUE #( (  78 ) ( 72 ) ( 51 ) ( 96 ) ( 99 ) ) )
        ( VALUE #( (  95 ) ( 10 ) ( 84 )  ( 0 ) ( 31 ) ) )
        ( VALUE #( (  91 ) ( 47 ) ( 66 ) ( 33 ) ( 34 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  11 ) ( 72 ) ( 55 ) ( 52 ) ( 79 ) ) )
        ( VALUE #( (  94 ) ( 34 ) ( 53 ) ( 61 ) ( 40 ) ) )
        ( VALUE #( ( 8 ) ( 31 ) ( 49 ) ( 68 ) ( 71 ) ) )
        ( VALUE #( (  37 ) ( 45 ) ( 15 ) ( 78 ) ( 57 ) ) )
        ( VALUE #( (  21 ) ( 88 ) ( 65 ) ( 24 ) ( 56 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  65 ) ( 59 )  ( 4 ) ( 41 ) ( 69 ) ) )
        ( VALUE #( (  44 ) ( 61 ) ( 23 ) ( 46 ) ( 42 ) ) )
        ( VALUE #( (  10 ) ( 68 ) ( 37 ) ( 54 ) ( 25 ) ) )
        ( VALUE #( (  82 )  ( 2 ) ( 13 ) ( 71 ) ( 93 ) ) )
        ( VALUE #( (  87 ) ( 90 ) ( 89 ) ( 57 ) ( 74 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  75 ) ( 70 ) ( 40 ) ( 68 ) ( 30 ) ) )
        ( VALUE #( ( 5 ) ( 28 ) ( 58 ) ( 52 ) ( 19 ) ) )
        ( VALUE #( (  80 ) ( 96 ) ( 53 ) ( 43 ) ( 63 ) ) )
        ( VALUE #( (  33 ) ( 60 ) ( 66 ) ( 64 ) ( 56 ) ) )
        ( VALUE #( (  88 ) ( 74 )  ( 9 )  ( 8 ) ( 36 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  58 ) ( 38 ) ( 46 ) ( 42 ) ( 89 ) ) )
        ( VALUE #( (  98 ) ( 85 ) ( 17 ) ( 51 )  ( 2 ) ) )
        ( VALUE #( (  28 ) ( 92 ) ( 22 ) ( 64 ) ( 53 ) ) )
        ( VALUE #( (  27 ) ( 97 ) ( 43 ) ( 10 ) ( 54 ) ) )
        ( VALUE #( (  75 ) ( 56 ) ( 71 ) ( 67 ) ( 79 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  75 ) ( 86 ) ( 11 )  ( 4 ) ( 39 ) ) )
        ( VALUE #( (  14 ) ( 80 ) ( 41 ) ( 26 )  ( 2 ) ) )
        ( VALUE #( (  97 ) ( 18 ) ( 96 )  ( 5 ) ( 28 ) ) )
        ( VALUE #( (  44 ) ( 68 ) ( 54 ) ( 88 ) ( 35 ) ) )
        ( VALUE #( (  57 ) ( 98 ) ( 74 ) ( 21 ) ( 19 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  45 ) ( 16 )  ( 4 ) ( 23 ) ( 63 ) ) )
        ( VALUE #( (  44 ) ( 37 ) ( 99 ) ( 21 ) ( 85 ) ) )
        ( VALUE #( ( 2 ) ( 82 ) ( 58 ) ( 10 ) ( 84 ) ) )
        ( VALUE #( ( 0 ) ( 47 ) ( 53 ) ( 33 ) ( 20 ) ) )
        ( VALUE #( (  93 ) ( 19 ) ( 39 ) ( 72 )  ( 8 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 5 ) ( 25 ) ( 24 ) ( 32 ) ( 44 ) ) )
        ( VALUE #( (  59 ) ( 37 ) ( 95 ) ( 88 ) ( 89 ) ) )
        ( VALUE #( (  68 ) ( 69 )  ( 8 ) ( 96 ) ( 99 ) ) )
        ( VALUE #( (  16 )  ( 0 )  ( 7 ) ( 92 ) ( 94 ) ) )
        ( VALUE #( (  65 ) ( 15 ) ( 55 ) ( 66 ) ( 31 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  65 ) ( 14 ) ( 92 ) ( 66 ) ( 69 ) ) )
        ( VALUE #( (  43 ) ( 45 ) ( 30 )  ( 8 ) ( 26 ) ) )
        ( VALUE #( (  87 ) ( 47 ) ( 18 ) ( 82 ) ( 76 ) ) )
        ( VALUE #( (  33 ) ( 80 ) ( 67 ) ( 35 ) ( 22 ) ) )
        ( VALUE #( (  38 ) ( 62 ) ( 84 ) ( 96 ) ( 52 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  39 ) ( 45 ) ( 15 ) ( 57 ) ( 53 ) ) )
        ( VALUE #( (  35 ) ( 47 ) ( 70 )  ( 4 )  ( 0 ) ) )
        ( VALUE #( (  50 ) ( 17 ) ( 65 ) ( 78 )  ( 3 ) ) )
        ( VALUE #( ( 2 )  ( 7 ) ( 28 ) ( 36 ) ( 42 ) ) )
        ( VALUE #( (  99 ) ( 48 ) ( 27 ) ( 83 ) ( 72 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  52 ) ( 47 ) ( 81 ) ( 44 ) ( 92 ) ) )
        ( VALUE #( (  35 ) ( 86 ) ( 36 ) ( 71 ) ( 29 ) ) )
        ( VALUE #( (  57 ) ( 15 )  ( 1 ) ( 95 )  ( 7 ) ) )
        ( VALUE #( (  68 ) ( 77 )  ( 6 )  ( 3 ) ( 31 ) ) )
        ( VALUE #( (  20 ) ( 13 ) ( 58 ) ( 89 ) ( 93 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 2 ) ( 56 ) ( 27 )  ( 4 ) ( 64 ) ) )
        ( VALUE #( (  69 ) ( 91 ) ( 88 ) ( 58 ) ( 15 ) ) )
        ( VALUE #( (  10 ) ( 92 ) ( 61 ) ( 63 )  ( 6 ) ) )
        ( VALUE #( (  84 ) ( 93 ) ( 79 ) ( 25 ) ( 90 ) ) )
        ( VALUE #( (  16 ) ( 31 ) ( 55 ) ( 46 ) ( 53 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  23 ) ( 42 ) ( 93 ) ( 12 ) ( 30 ) ) )
        ( VALUE #( (  47 ) ( 99 ) ( 38 )  ( 0 ) ( 14 ) ) )
        ( VALUE #( ( 6 ) ( 90 ) ( 72 ) ( 70 ) ( 21 ) ) )
        ( VALUE #( (  62 ) ( 61 ) ( 96 ) ( 87 ) ( 22 ) ) )
        ( VALUE #( ( 5 ) ( 55 ) ( 51 ) ( 28 ) ( 17 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  42 ) ( 12 ) ( 58 ) ( 95 ) ( 92 ) ) )
        ( VALUE #( (  67 ) ( 89 ) ( 88 ) ( 87 ) ( 47 ) ) )
        ( VALUE #( (  32 ) ( 72 ) ( 11 ) ( 83 ) ( 97 ) ) )
        ( VALUE #( (  55 ) ( 16 ) ( 66 ) ( 57 ) ( 29 ) ) )
        ( VALUE #( (  54 ) ( 64 ) ( 96 )  ( 2 ) ( 36 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  72 ) ( 47 ) ( 69 ) ( 68 ) ( 12 ) ) )
        ( VALUE #( (  23 )  ( 4 ) ( 37 ) ( 79 ) ( 13 ) ) )
        ( VALUE #( (  52 )  ( 5 ) ( 59 ) ( 58 ) ( 70 ) ) )
        ( VALUE #( (  44 )  ( 3 ) ( 21 ) ( 93 ) ( 76 ) ) )
        ( VALUE #( (  97 )  ( 0 ) ( 35 )  ( 9 ) ( 71 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  87 ) ( 49 ) ( 55 ) ( 18 ) ( 94 ) ) )
        ( VALUE #( (  68 ) ( 32 ) ( 99 ) ( 50 ) ( 37 ) ) )
        ( VALUE #( (  15 )  ( 3 ) ( 80 ) ( 90 ) ( 42 ) ) )
        ( VALUE #( (  83 ) ( 12 ) ( 41 ) ( 21 ) ( 58 ) ) )
        ( VALUE #( (  91 ) ( 89 ) ( 74 ) ( 45 ) ( 51 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 5 ) ( 60 ) ( 13 ) ( 46 ) ( 47 ) ) )
        ( VALUE #( (  18 ) ( 54 ) ( 33 ) ( 26 )  ( 0 ) ) )
        ( VALUE #( (  28 ) ( 43 ) ( 83 ) ( 31 ) ( 20 ) ) )
        ( VALUE #( (  12 ) ( 75 ) ( 34 ) ( 36 )  ( 4 ) ) )
        ( VALUE #( (  76 )  ( 2 ) ( 80 ) ( 70 ) ( 79 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  16 ) ( 66 ) ( 25 ) ( 97 ) ( 20 ) ) )
        ( VALUE #( (  52 ) ( 23 ) ( 80 ) ( 74 ) ( 90 ) ) )
        ( VALUE #( (  31 ) ( 81 ) ( 95 ) ( 28 ) ( 36 ) ) )
        ( VALUE #( (  99 )  ( 8 ) ( 50 ) ( 57 ) ( 98 ) ) )
        ( VALUE #( (  11 )  ( 0 ) ( 30 ) ( 35 ) ( 39 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  12 ) ( 33 ) ( 36 ) ( 90 ) ( 30 ) ) )
        ( VALUE #( (  59 ) ( 66 ) ( 77 ) ( 25 ) ( 46 ) ) )
        ( VALUE #( (  88 ) ( 24 )  ( 4 ) ( 41 ) ( 50 ) ) )
        ( VALUE #( (  18 ) ( 52 ) ( 37 ) ( 75 ) ( 43 ) ) )
        ( VALUE #( (  68 ) ( 49 ) ( 56 ) ( 84 ) ( 87 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  27 ) ( 80 ) ( 51 ) ( 25 ) ( 93 ) ) )
        ( VALUE #( ( 4 ) ( 41 ) ( 61 ) ( 30 ) ( 67 ) ) )
        ( VALUE #( (  68 ) ( 47 ) ( 15 ) ( 20 ) ( 50 ) ) )
        ( VALUE #( (  78 ) ( 66 ) ( 97 ) ( 54 ) ( 84 ) ) )
        ( VALUE #( (  35 )  ( 1 ) ( 23 ) ( 89 ) ( 14 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  82 ) ( 51 ) ( 38 ) ( 80 ) ( 75 ) ) )
        ( VALUE #( (  35 ) ( 79 ) ( 43 ) ( 54 )  ( 3 ) ) )
        ( VALUE #( (  73 ) ( 13 ) ( 23 ) ( 25 ) ( 59 ) ) )
        ( VALUE #( (  27 ) ( 64 ) ( 47 ) ( 62 ) ( 66 ) ) )
        ( VALUE #( (  83 )  ( 0 )  ( 7 )  ( 4 ) ( 20 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  67 )  ( 2 ) ( 72 ) ( 23 ) ( 81 ) ) )
        ( VALUE #( (  46 )  ( 1 ) ( 26 ) ( 85 ) ( 25 ) ) )
        ( VALUE #( (  31 ) ( 65 ) ( 52 ) ( 16 ) ( 14 ) ) )
        ( VALUE #( (  15 )  ( 4 ) ( 91 ) ( 59 ) ( 19 ) ) )
        ( VALUE #( (  83 ) ( 60 ) ( 10 ) ( 89 ) ( 90 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  62 ) ( 63 ) ( 13 ) ( 96 )  ( 6 ) ) )
        ( VALUE #( (  24 ) ( 91 ) ( 27 ) ( 29 ) ( 81 ) ) )
        ( VALUE #( (  38 ) ( 47 ) ( 50 ) ( 26 ) ( 36 ) ) )
        ( VALUE #( (  79 ) ( 73 ) ( 22 ) ( 45 ) ( 58 ) ) )
        ( VALUE #( (  15 ) ( 54 ) ( 76 ) ( 46 ) ( 70 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  42 ) ( 69 ) ( 91 ) ( 34 )  ( 9 ) ) )
        ( VALUE #( (  96 ) ( 28 ) ( 61 ) ( 41 ) ( 56 ) ) )
        ( VALUE #( (  15 )  ( 5 ) ( 59 ) ( 47 ) ( 50 ) ) )
        ( VALUE #( (  79 ) ( 27 )  ( 4 )  ( 0 ) ( 21 ) ) )
        ( VALUE #( (  51 ) ( 44 ) ( 26 ) ( 95 ) ( 32 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 9 ) ( 38 )  ( 6 ) ( 58 ) ( 99 ) ) )
        ( VALUE #( (  89 ) ( 69 ) ( 96 ) ( 33 ) ( 73 ) ) )
        ( VALUE #( (  26 ) ( 20 ) ( 32 ) ( 12 ) ( 27 ) ) )
        ( VALUE #( (  67 ) ( 29 ) ( 79 ) ( 81 ) ( 59 ) ) )
        ( VALUE #( (  66 ) ( 45 ) ( 24 ) ( 36 ) ( 68 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  99 ) ( 52 )  ( 1 ) ( 66 ) ( 64 ) ) )
        ( VALUE #( (  15 ) ( 76 ) ( 36 ) ( 75 ) ( 83 ) ) )
        ( VALUE #( (  48 )  ( 7 ) ( 95 ) ( 71 )  ( 6 ) ) )
        ( VALUE #( (  31 ) ( 28 ) ( 65 ) ( 14 ) ( 69 ) ) )
        ( VALUE #( (  10 ) ( 38 ) ( 46 ) ( 74 ) ( 96 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  15 ) ( 12 ) ( 59 ) ( 98 ) ( 54 ) ) )
        ( VALUE #( (  18 ) ( 75 ) ( 48 ) ( 65 ) ( 96 ) ) )
        ( VALUE #( (  57 ) ( 38 )  ( 2 ) ( 86 )  ( 5 ) ) )
        ( VALUE #( ( 0 ) ( 87 ) ( 93 ) ( 23 ) ( 94 ) ) )
        ( VALUE #( (  50 ) ( 29 ) ( 13 ) ( 91 ) ( 14 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  55 ) ( 83 ) ( 80 ) ( 45 ) ( 52 ) ) )
        ( VALUE #( (  44 ) ( 31 ) ( 64 ) ( 25 ) ( 71 ) ) )
        ( VALUE #( (  15 ) ( 85 ) ( 50 ) ( 91 ) ( 54 ) ) )
        ( VALUE #( ( 9 ) ( 29 ) ( 78 ) ( 74 ) ( 23 ) ) )
        ( VALUE #( (  73 ) ( 82 ) ( 75 ) ( 58 ) ( 98 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  63 ) ( 56 ) ( 29 ) ( 80 ) ( 25 ) ) )
        ( VALUE #( (  53 ) ( 52 ) ( 91 ) ( 18 ) ( 24 ) ) )
        ( VALUE #( (  73 ) ( 83 )  ( 7 ) ( 11 ) ( 87 ) ) )
        ( VALUE #( (  79 ) ( 47 ) ( 41 ) ( 59 ) ( 78 ) ) )
        ( VALUE #( (  13 ) ( 51 )  ( 9 ) ( 21 ) ( 20 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  28 ) ( 35 ) ( 98 ) ( 80 ) ( 63 ) ) )
        ( VALUE #( (  30 ) ( 60 ) ( 34 ) ( 99 ) ( 32 ) ) )
        ( VALUE #( (  11 ) ( 61 ) ( 15 ) ( 73 ) ( 24 ) ) )
        ( VALUE #( (  55 ) ( 74 ) ( 42 ) ( 38 ) ( 26 ) ) )
        ( VALUE #( (  22 ) ( 17 ) ( 43 ) ( 75 ) ( 71 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  97 ) ( 53 ) ( 65 ) ( 75 ) ( 51 ) ) )
        ( VALUE #( (  96 ) ( 74 ) ( 81 ) ( 69 ) ( 71 ) ) )
        ( VALUE #( (  76 )  ( 5 ) ( 49 ) ( 60 ) ( 41 ) ) )
        ( VALUE #( (  86 ) ( 64 ) ( 90 ) ( 92 ) ( 30 ) ) )
        ( VALUE #( ( 6 ) ( 95 ) ( 85 ) ( 93 ) ( 40 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  65 ) ( 90 ) ( 20 )  ( 4 ) ( 82 ) ) )
        ( VALUE #( (  41 ) ( 17 ) ( 48 ) ( 27 ) ( 77 ) ) )
        ( VALUE #( (  84 ) ( 60 ) ( 94 ) ( 15 ) ( 10 ) ) )
        ( VALUE #( (  55 ) ( 64 ) ( 49 ) ( 35 ) ( 16 ) ) )
        ( VALUE #( (  36 )  ( 8 ) ( 23 ) ( 58 ) ( 59 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  74 ) ( 19 ) ( 70 ) ( 35 ) ( 82 ) ) )
        ( VALUE #( (  77 ) ( 21 ) ( 84 ) ( 50 ) ( 25 ) ) )
        ( VALUE #( (  18 ) ( 61 ) ( 12 ) ( 28 ) ( 54 ) ) )
        ( VALUE #( ( 0 )  ( 3 ) ( 72 ) ( 85 ) ( 87 ) ) )
        ( VALUE #( (  78 )  ( 4 ) ( 57 ) ( 38 ) ( 16 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 1 ) ( 63 )  ( 0 ) ( 38 ) ( 23 ) ) )
        ( VALUE #( (  31 ) ( 76 ) ( 73 ) ( 22 ) ( 35 ) ) )
        ( VALUE #( ( 8 ) ( 72 ) ( 44 ) ( 25 ) ( 45 ) ) )
        ( VALUE #( (  70 ) ( 33 ) ( 29 ) ( 37 ) ( 21 ) ) )
        ( VALUE #( (  49 ) ( 50 ) ( 85 ) ( 57 ) ( 61 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  37 ) ( 50 ) ( 51 ) ( 12 ) ( 93 ) ) )
        ( VALUE #( (  83 ) ( 80 ) ( 87 )  ( 6 ) ( 88 ) ) )
        ( VALUE #( ( 4 ) ( 95 ) ( 62 ) ( 20 ) ( 41 ) ) )
        ( VALUE #( (  78 ) ( 56 ) ( 76 ) ( 49 ) ( 11 ) ) )
        ( VALUE #( (  72 )  ( 7 ) ( 52 ) ( 14 ) ( 28 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  72 ) ( 34 ) ( 61 ) ( 19 ) ( 68 ) ) )
        ( VALUE #( ( 2 ) ( 67 ) ( 88 )  ( 7 ) ( 55 ) ) )
        ( VALUE #( ( 8 ) ( 11 ) ( 20 ) ( 85 ) ( 47 ) ) )
        ( VALUE #( (  42 ) ( 54 ) ( 46 ) ( 48 ) ( 64 ) ) )
        ( VALUE #( (  38 ) ( 84 )  ( 3 ) ( 76 ) ( 13 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  32 ) ( 34 ) ( 55 ) ( 90 ) ( 64 ) ) )
        ( VALUE #( (  16 )  ( 1 ) ( 94 ) ( 48 ) ( 91 ) ) )
        ( VALUE #( (  96 ) ( 45 ) ( 27 ) ( 58 ) ( 63 ) ) )
        ( VALUE #( (  98 ) ( 20 ) ( 43 ) ( 73 ) ( 10 ) ) )
        ( VALUE #( (  87 ) ( 52 ) ( 49 )  ( 8 ) ( 24 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 6 )  ( 9 ) ( 31 ) ( 37 ) ( 29 ) ) )
        ( VALUE #( (  45 ) ( 55 ) ( 12 ) ( 23 ) ( 67 ) ) )
        ( VALUE #( (  86 )  ( 0 ) ( 81 ) ( 49 )  ( 1 ) ) )
        ( VALUE #( (  18 ) ( 25 )  ( 7 ) ( 15 ) ( 50 ) ) )
        ( VALUE #( (  32 ) ( 34 ) ( 90 ) ( 99 ) ( 69 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  38 ) ( 73 ) ( 44 ) ( 17 ) ( 52 ) ) )
        ( VALUE #( ( 7 ) ( 81 ) ( 85 ) ( 62 ) ( 98 ) ) )
        ( VALUE #( (  68 ) ( 66 ) ( 86 ) ( 21 ) ( 76 ) ) )
        ( VALUE #( (  24 ) ( 94 ) ( 50 ) ( 46 ) ( 67 ) ) )
        ( VALUE #( (  36 ) ( 54 ) ( 55 ) ( 96 )  ( 8 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  90 ) ( 39 ) ( 51 )  ( 5 ) ( 99 ) ) )
        ( VALUE #( (  33 ) ( 20 ) ( 14 )  ( 1 ) ( 81 ) ) )
        ( VALUE #( (  94 ) ( 74 ) ( 38 ) ( 95 ) ( 35 ) ) )
        ( VALUE #( (  37 ) ( 96 ) ( 62 ) ( 57 ) ( 84 ) ) )
        ( VALUE #( (  65 ) ( 11 ) ( 55 ) ( 46 ) ( 69 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  26 ) ( 29 ) ( 75 )  ( 3 ) ( 55 ) ) )
        ( VALUE #( (  33 ) ( 83 ) ( 68 ) ( 94 ) ( 47 ) ) )
        ( VALUE #( (  37 ) ( 41 ) ( 85 ) ( 50 ) ( 57 ) ) )
        ( VALUE #( (  76 ) ( 39 )  ( 5 ) ( 81 ) ( 20 ) ) )
        ( VALUE #( (  18 ) ( 24 ) ( 92 ) ( 71 ) ( 87 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  89 ) ( 92 ) ( 39 ) ( 70 ) ( 59 ) ) )
        ( VALUE #( (  40 ) ( 35 ) ( 23 ) ( 62 ) ( 47 ) ) )
        ( VALUE #( ( 7 ) ( 16 ) ( 22 ) ( 34 ) ( 71 ) ) )
        ( VALUE #( (  15 ) ( 97 ) ( 86 ) ( 91 )  ( 3 ) ) )
        ( VALUE #( (  54 ) ( 26 ) ( 56 ) ( 44 ) ( 29 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  93 ) ( 91 ) ( 66 )  ( 8 ) ( 78 ) ) )
        ( VALUE #( (  60 ) ( 48 ) ( 51 )  ( 6 ) ( 57 ) ) )
        ( VALUE #( (  69 ) ( 35 ) ( 87 ) ( 65 ) ( 73 ) ) )
        ( VALUE #( (  53 ) ( 32 ) ( 94 ) ( 49 ) ( 89 ) ) )
        ( VALUE #( (  88 ) ( 34 ) ( 23 ) ( 84 ) ( 59 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  41 ) ( 57 )  ( 7 ) ( 37 )  ( 0 ) ) )
        ( VALUE #( (  79 )  ( 2 ) ( 86 ) ( 82 )  ( 9 ) ) )
        ( VALUE #( (  25 ) ( 69 ) ( 14 ) ( 78 ) ( 33 ) ) )
        ( VALUE #( ( 4 ) ( 28 ) ( 85 )  ( 8 ) ( 61 ) ) )
        ( VALUE #( (  97 ) ( 72 ) ( 88 )  ( 1 ) ( 54 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  24 ) ( 84 ) ( 65 ) ( 28 ) ( 60 ) ) )
        ( VALUE #( (  99 ) ( 86 ) ( 53 ) ( 93 ) ( 22 ) ) )
        ( VALUE #( (  17 ) ( 67 ) ( 10 ) ( 29 ) ( 54 ) ) )
        ( VALUE #( (  27 )  ( 0 ) ( 96 ) ( 20 ) ( 36 ) ) )
        ( VALUE #( (  25 )  ( 3 ) ( 62 ) ( 89 ) ( 33 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  10 ) ( 28 ) ( 78 ) ( 82 ) ( 96 ) ) )
        ( VALUE #( (  21 ) ( 11 ) ( 51 ) ( 27 ) ( 97 ) ) )
        ( VALUE #( (  41 ) ( 63 ) ( 72 ) ( 58 ) ( 89 ) ) )
        ( VALUE #( ( 7 )  ( 0 ) ( 76 ) ( 67 ) ( 19 ) ) )
        ( VALUE #( (  52 ) ( 38 ) ( 87 ) ( 18 ) ( 13 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  73 ) ( 35 ) ( 49 ) ( 44 ) ( 79 ) ) )
        ( VALUE #( (  76 ) ( 47 ) ( 94 ) ( 53 ) ( 82 ) ) )
        ( VALUE #( (  11 ) ( 61 ) ( 88 ) ( 86 ) ( 83 ) ) )
        ( VALUE #( (  81 ) ( 60 ) ( 33 ) ( 99 ) ( 72 ) ) )
        ( VALUE #( (  84 ) ( 26 ) ( 40 )  ( 8 ) ( 54 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  31 ) ( 50 ) ( 40 )  ( 9 ) ( 80 ) ) )
        ( VALUE #( ( 6 ) ( 59 ) ( 51 ) ( 55 ) ( 12 ) ) )
        ( VALUE #( ( 2 ) ( 34 ) ( 93 ) ( 38 ) ( 13 ) ) )
        ( VALUE #( (  11 ) ( 82 ) ( 21 ) ( 20 ) ( 72 ) ) )
        ( VALUE #( (  89 ) ( 83 ) ( 60 ) ( 53 ) ( 79 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  42 ) ( 54 ) ( 52 ) ( 13 ) ( 85 ) ) )
        ( VALUE #( (  99 ) ( 76 ) ( 87 ) ( 44 ) ( 26 ) ) )
        ( VALUE #( (  36 ) ( 50 )  ( 0 ) ( 59 ) ( 82 ) ) )
        ( VALUE #( (  10 ) ( 73 ) ( 29 ) ( 72 ) ( 27 ) ) )
        ( VALUE #( (  79 ) ( 31 ) ( 64 ) ( 51 ) ( 91 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  68 ) ( 49 ) ( 65 ) ( 94 )  ( 3 ) ) )
        ( VALUE #( (  46 )  ( 2 )  ( 6 ) ( 78 ) ( 93 ) ) )
        ( VALUE #( (  63 ) ( 31 ) ( 53 ) ( 27 ) ( 60 ) ) )
        ( VALUE #( (  21 ) ( 67 ) ( 99 ) ( 22 ) ( 95 ) ) )
        ( VALUE #( (  24 )  ( 9 ) ( 18 ) ( 76 ) ( 33 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  31 ) ( 95 ) ( 91 ) ( 18 ) ( 37 ) ) )
        ( VALUE #( (  83 )  ( 2 ) ( 78 ) ( 75 )  ( 8 ) ) )
        ( VALUE #( (  77 ) ( 33 )  ( 9 ) ( 12 ) ( 22 ) ) )
        ( VALUE #( (  24 ) ( 50 ) ( 80 ) ( 93 ) ( 39 ) ) )
        ( VALUE #( (  21 ) ( 47 ) ( 35 ) ( 70 ) ( 94 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 2 ) ( 44 ) ( 55 ) ( 60 ) ( 89 ) ) )
        ( VALUE #( (  45 ) ( 18 ) ( 46 ) ( 72 ) ( 11 ) ) )
        ( VALUE #( (  47 ) ( 83 ) ( 56 ) ( 52 ) ( 65 ) ) )
        ( VALUE #( ( 4 ) ( 19 ) ( 21 ) ( 14 ) ( 34 ) ) )
        ( VALUE #( (  25 ) ( 80 ) ( 16 ) ( 48 ) ( 36 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  53 ) ( 92 ) ( 71 ) ( 14 ) ( 95 ) ) )
        ( VALUE #( (  98 ) ( 51 ) ( 54 ) ( 15 ) ( 82 ) ) )
        ( VALUE #( (  48 ) ( 87 ) ( 99 ) ( 46 ) ( 83 ) ) )
        ( VALUE #( (  42 ) ( 86 ) ( 11 ) ( 43 ) ( 18 ) ) )
        ( VALUE #( (  72 ) ( 28 ) ( 37 ) ( 93 ) ( 78 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  84 ) ( 79 ) ( 30 ) ( 28 ) ( 98 ) ) )
        ( VALUE #( (  33 ) ( 80 ) ( 65 ) ( 82 ) ( 25 ) ) )
        ( VALUE #( (  35 ) ( 29 ) ( 46 ) ( 13 ) ( 60 ) ) )
        ( VALUE #( (  90 ) ( 69 ) ( 52 ) ( 78 ) ( 64 ) ) )
        ( VALUE #( (  55 ) ( 94 )  ( 0 ) ( 48 ) ( 56 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  42 ) ( 71 ) ( 26 ) ( 93 ) ( 82 ) ) )
        ( VALUE #( (  47 ) ( 36 ) ( 31 ) ( 89 ) ( 69 ) ) )
        ( VALUE #( (  65 )  ( 5 ) ( 41 )  ( 1 ) ( 32 ) ) )
        ( VALUE #( (  74 ) ( 17 ) ( 64 ) ( 11 ) ( 68 ) ) )
        ( VALUE #( (  23 ) ( 54 ) ( 61 ) ( 99 ) ( 37 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  97 )  ( 4 ) ( 22 )  ( 2 ) ( 38 ) ) )
        ( VALUE #( ( 8 ) ( 17 ) ( 79 ) ( 99 ) ( 20 ) ) )
        ( VALUE #( (  44 ) ( 80 ) ( 28 ) ( 57 ) ( 32 ) ) )
        ( VALUE #( (  18 ) ( 86 ) ( 94 ) ( 77 ) ( 70 ) ) )
        ( VALUE #( (  11 ) ( 93 ) ( 75 ) ( 49 )  ( 3 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  80 ) ( 48 ) ( 85 ) ( 89 ) ( 23 ) ) )
        ( VALUE #( (  30 ) ( 50 ) ( 94 ) ( 46 ) ( 18 ) ) )
        ( VALUE #( (  59 )  ( 9 ) ( 81 ) ( 42 )  ( 8 ) ) )
        ( VALUE #( (  40 ) ( 15 ) ( 90 ) ( 26 ) ( 31 ) ) )
        ( VALUE #( ( 0 ) ( 51 ) ( 39 ) ( 36 ) ( 65 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  93 ) ( 63 ) ( 15 ) ( 87 ) ( 25 ) ) )
        ( VALUE #( (  90 ) ( 44 ) ( 65 ) ( 23 ) ( 66 ) ) )
        ( VALUE #( (  22 ) ( 27 ) ( 20 ) ( 17 ) ( 45 ) ) )
        ( VALUE #( (  42 ) ( 62 ) ( 14 )  ( 0 ) ( 57 ) ) )
        ( VALUE #( (  46 )  ( 4 ) ( 10 ) ( 35 ) ( 96 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  44 ) ( 43 ) ( 60 ) ( 80 ) ( 86 ) ) )
        ( VALUE #( (  48 ) ( 45 ) ( 78 ) ( 40 ) ( 19 ) ) )
        ( VALUE #( (  54 ) ( 98 ) ( 32 ) ( 17 ) ( 69 ) ) )
        ( VALUE #( (  25 ) ( 11 ) ( 14 ) ( 34 ) ( 63 ) ) )
        ( VALUE #( (  26 ) ( 20 ) ( 59 )  ( 0 ) ( 74 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 0 ) ( 59 ) ( 87 ) ( 45 ) ( 30 ) ) )
        ( VALUE #( (  33 ) ( 36 )  ( 1 ) ( 38 ) ( 43 ) ) )
        ( VALUE #( (  67 ) ( 37 ) ( 74 )  ( 2 ) ( 70 ) ) )
        ( VALUE #( (  85 ) ( 22 ) ( 44 ) ( 56 ) ( 23 ) ) )
        ( VALUE #( (  68 ) ( 24 ) ( 75 ) ( 92 ) ( 10 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  90 ) ( 83 ) ( 87 ) ( 85 ) ( 67 ) ) )
        ( VALUE #( (  95 ) ( 24 ) ( 94 )  ( 6 ) ( 40 ) ) )
        ( VALUE #( (  77 ) ( 15 ) ( 52 ) ( 68 ) ( 66 ) ) )
        ( VALUE #( (  22 ) ( 20 ) ( 38 ) ( 29 ) ( 79 ) ) )
        ( VALUE #( ( 3 ) ( 10 ) ( 62 ) ( 13 ) ( 16 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 9 ) ( 49 ) ( 87 ) ( 13 ) ( 18 ) ) )
        ( VALUE #( (  85 ) ( 39 ) ( 77 ) ( 82 ) ( 86 ) ) )
        ( VALUE #( (  96 ) ( 44 ) ( 12 ) ( 72 ) ( 78 ) ) )
        ( VALUE #( (  59 ) ( 81 ) ( 21 ) ( 94 ) ( 88 ) ) )
        ( VALUE #( (  17 ) ( 93 ) ( 23 ) ( 56 ) ( 45 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  57 ) ( 53 ) ( 80 ) ( 98 ) ( 22 ) ) )
        ( VALUE #( (  23 ) ( 45 )  ( 5 ) ( 26 ) ( 77 ) ) )
        ( VALUE #( ( 6 ) ( 28 )  ( 4 ) ( 25 ) ( 83 ) ) )
        ( VALUE #( (  59 ) ( 55 ) ( 58 ) ( 75 ) ( 92 ) ) )
        ( VALUE #( (  72 ) ( 36 ) ( 99 ) ( 82 ) ( 97 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  74 ) ( 33 ) ( 53 ) ( 49 ) ( 86 ) ) )
        ( VALUE #( ( 9 ) ( 50 ) ( 66 )  ( 7 ) ( 78 ) ) )
        ( VALUE #( (  29 ) ( 36 ) ( 71 ) ( 26 ) ( 87 ) ) )
        ( VALUE #( (  54 ) ( 82 ) ( 84 ) ( 47 ) ( 46 ) ) )
        ( VALUE #( (  39 ) ( 30 ) ( 56 ) ( 22 ) ( 27 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 6 ) ( 49 ) ( 84 ) ( 14 ) ( 43 ) ) )
        ( VALUE #( (  41 ) ( 44 ) ( 29 ) ( 18 ) ( 79 ) ) )
        ( VALUE #( (  93 ) ( 56 ) ( 77 ) ( 64 ) ( 26 ) ) )
        ( VALUE #( (  15 ) ( 13 ) ( 96 )  ( 9 ) ( 80 ) ) )
        ( VALUE #( (  50 ) ( 54 ) ( 75 ) ( 99 ) ( 24 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  58 ) ( 49 ) ( 91 ) ( 69 ) ( 63 ) ) )
        ( VALUE #( (  16 ) ( 55 ) ( 19 ) ( 18 ) ( 84 ) ) )
        ( VALUE #( (  13 ) ( 79 ) ( 42 ) ( 56 )  ( 0 ) ) )
        ( VALUE #( (  36 ) ( 27 ) ( 60 ) ( 74 ) ( 53 ) ) )
        ( VALUE #( (  66 ) ( 61 ) ( 62 ) ( 54 ) ( 15 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  85 ) ( 22 ) ( 43 ) ( 79 ) ( 90 ) ) )
        ( VALUE #( (  77 ) ( 21 ) ( 75 ) ( 66 ) ( 15 ) ) )
        ( VALUE #( (  25 ) ( 68 ) ( 69 ) ( 35 ) ( 78 ) ) )
        ( VALUE #( (  88 )  ( 3 ) ( 18 ) ( 50 )  ( 7 ) ) )
        ( VALUE #( ( 8 ) ( 27 ) ( 52 ) ( 76 ) ( 72 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  12 ) ( 56 )  ( 0 ) ( 45 ) ( 33 ) ) )
        ( VALUE #( (  13 ) ( 81 ) ( 25 ) ( 24 ) ( 41 ) ) )
        ( VALUE #( (  80 ) ( 65 )  ( 9 ) ( 32 ) ( 95 ) ) )
        ( VALUE #( (  18 ) ( 44 ) ( 36 ) ( 68 ) ( 99 ) ) )
        ( VALUE #( (  78 ) ( 29 ) ( 17 ) ( 38 ) ( 43 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  57 ) ( 41 ) ( 77 )  ( 5 ) ( 10 ) ) )
        ( VALUE #( (  98 ) ( 30 ) ( 70 ) ( 23 ) ( 46 ) ) )
        ( VALUE #( ( 9 ) ( 19 ) ( 11 ) ( 34 ) ( 74 ) ) )
        ( VALUE #( (  43 ) ( 33 ) ( 32 ) ( 95 ) ( 14 ) ) )
        ( VALUE #( (  65 )  ( 8 ) ( 68 ) ( 50 ) ( 88 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  49 ) ( 93 ) ( 95 )  ( 1 ) ( 55 ) ) )
        ( VALUE #( (  57 ) ( 92 ) ( 58 )  ( 0 ) ( 90 ) ) )
        ( VALUE #( (  69 ) ( 15 ) ( 23 ) ( 62 ) ( 56 ) ) )
        ( VALUE #( (  54 ) ( 37 )  ( 6 ) ( 96 ) ( 11 ) ) )
        ( VALUE #( (  26 ) ( 80 ) ( 70 ) ( 79 ) ( 88 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  46 ) ( 76 ) ( 82 ) ( 77 ) ( 19 ) ) )
        ( VALUE #( ( 4 ) ( 50 ) ( 83 ) ( 88 ) ( 69 ) ) )
        ( VALUE #( (  67 ) ( 44 ) ( 59 ) ( 25 ) ( 21 ) ) )
        ( VALUE #( (  40 ) ( 12 ) ( 90 ) ( 33 ) ( 24 ) ) )
        ( VALUE #( (  63 ) ( 78 )  ( 9 ) ( 71 ) ( 86 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  74 ) ( 82 ) ( 88 ) ( 25 ) ( 15 ) ) )
        ( VALUE #( (  61 ) ( 83 )  ( 7 )  ( 6 ) ( 98 ) ) )
        ( VALUE #( (  41 )  ( 9 ) ( 84 ) ( 13 ) ( 72 ) ) )
        ( VALUE #( (  78 ) ( 26 )  ( 8 ) ( 60 ) ( 20 ) ) )
        ( VALUE #( ( 4 ) ( 58 ) ( 29 ) ( 93 ) ( 11 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  46 ) ( 60 ) ( 44 ) ( 55 ) ( 63 ) ) )
        ( VALUE #( (  91 ) ( 19 ) ( 58 ) ( 56 ) ( 85 ) ) )
        ( VALUE #( ( 2 ) ( 32 ) ( 67 ) ( 26 ) ( 41 ) ) )
        ( VALUE #( (  43 ) ( 61 ) ( 25 ) ( 73 ) ( 21 ) ) )
        ( VALUE #( (  86 ) ( 14 ) ( 71 )  ( 9 )  ( 6 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  38 ) ( 72 ) ( 58 ) ( 17 ) ( 77 ) ) )
        ( VALUE #( (  25 ) ( 79 ) ( 78 )  ( 5 ) ( 67 ) ) )
        ( VALUE #( (  81 ) ( 70 ) ( 50 ) ( 85 ) ( 73 ) ) )
        ( VALUE #( ( 7 ) ( 69 ) ( 14 ) ( 80 )  ( 6 ) ) )
        ( VALUE #( (  93 ) ( 51 ) ( 60 ) ( 42 ) ( 29 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  82 ) ( 28 ) ( 99 ) ( 66 ) ( 27 ) ) )
        ( VALUE #( (  35 ) ( 97 ) ( 91 ) ( 90 ) ( 80 ) ) )
        ( VALUE #( (  87 )  ( 7 ) ( 55 ) ( 78 ) ( 17 ) ) )
        ( VALUE #( (  83 ) ( 36 ) ( 98 ) ( 37 ) ( 72 ) ) )
        ( VALUE #( (  58 ) ( 43 ) ( 51 ) ( 49 ) ( 56 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  93 ) ( 72 ) ( 61 ) ( 19 ) ( 74 ) ) )
        ( VALUE #( (  81 ) ( 44 ) ( 27 ) ( 25 ) ( 12 ) ) )
        ( VALUE #( (  96 ) ( 10 ) ( 26 ) ( 69 ) ( 99 ) ) )
        ( VALUE #( (  94 ) ( 23 ) ( 63 ) ( 52 )  ( 8 ) ) )
        ( VALUE #( (  71 ) ( 95 ) ( 17 ) ( 54 ) ( 70 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  28 ) ( 21 ) ( 33 )  ( 5 ) ( 26 ) ) )
        ( VALUE #( (  45 ) ( 86 ) ( 63 ) ( 92 ) ( 69 ) ) )
        ( VALUE #( (  77 ) ( 43 ) ( 99 ) ( 20 ) ( 56 ) ) )
        ( VALUE #( (  89 ) ( 40 ) ( 36 ) ( 30 ) ( 53 ) ) )
        ( VALUE #( (  41 ) ( 32 ) ( 94 ) ( 17 ) ( 58 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  83 ) ( 63 ) ( 92 ) ( 93 ) ( 51 ) ) )
        ( VALUE #( (  11 ) ( 86 ) ( 67 )  ( 3 ) ( 61 ) ) )
        ( VALUE #( (  81 ) ( 50 ) ( 16 ) ( 90 ) ( 89 ) ) )
        ( VALUE #( ( 0 ) ( 75 ) ( 31 ) ( 22 ) ( 77 ) ) )
        ( VALUE #( (  82 ) ( 74 ) ( 37 ) ( 57 ) ( 39 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  49 ) ( 87 ) ( 33 )  ( 0 ) ( 13 ) ) )
        ( VALUE #( (  54 ) ( 38 ) ( 71 ) ( 85 ) ( 32 ) ) )
        ( VALUE #( (  79 ) ( 84 ) ( 89 )  ( 4 ) ( 61 ) ) )
        ( VALUE #( (  34 ) ( 14 ) ( 69 ) ( 47 )  ( 3 ) ) )
        ( VALUE #( (  35 ) ( 12 ) ( 59 )  ( 1 ) ( 55 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  95 ) ( 37 ) ( 72 ) ( 73 ) ( 85 ) ) )
        ( VALUE #( ( 0 ) ( 69 ) ( 50 ) ( 75 ) ( 55 ) ) )
        ( VALUE #( (  51 ) ( 24 ) ( 90 ) ( 71 ) ( 78 ) ) )
        ( VALUE #( (  66 ) ( 86 ) ( 23 ) ( 40 )  ( 6 ) ) )
        ( VALUE #( (  34 ) ( 27 ) ( 43 ) ( 14 ) ( 65 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  46 ) ( 11 ) ( 41 ) ( 86 ) ( 21 ) ) )
        ( VALUE #( (  31 ) ( 82 ) ( 38 ) ( 23 ) ( 53 ) ) )
        ( VALUE #( (  66 ) ( 52 ) ( 39 )  ( 6 )  ( 1 ) ) )
        ( VALUE #( (  16 ) ( 95 ) ( 36 )  ( 0 ) ( 69 ) ) )
        ( VALUE #( (  28 ) ( 54 ) ( 91 ) ( 99 ) ( 60 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  32 ) ( 80 )  ( 4 )  ( 3 ) ( 97 ) ) )
        ( VALUE #( (  26 ) ( 63 ) ( 89 ) ( 52 ) ( 22 ) ) )
        ( VALUE #( (  25 ) ( 91 ) ( 43 ) ( 96 ) ( 68 ) ) )
        ( VALUE #( (  71 ) ( 42 ) ( 78 ) ( 34 ) ( 56 ) ) )
        ( VALUE #( ( 0 ) ( 82 )  ( 5 ) ( 69 ) ( 19 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  69 ) ( 60 ) ( 58 ) ( 19 )  ( 1 ) ) )
        ( VALUE #( (  91 ) ( 59 ) ( 54 ) ( 52 ) ( 11 ) ) )
        ( VALUE #( (  43 ) ( 46 ) ( 27 )  ( 2 )  ( 7 ) ) )
        ( VALUE #( (  89 ) ( 57 ) ( 42 ) ( 88 ) ( 31 ) ) )
        ( VALUE #( (  93 ) ( 94 ) ( 37 ) ( 96 ) ( 29 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  72 )  ( 8 ) ( 29 ) ( 64 ) ( 75 ) ) )
        ( VALUE #( (  16 ) ( 45 )  ( 0 ) ( 39 ) ( 46 ) ) )
        ( VALUE #( (  77 )  ( 6 ) ( 88 ) ( 40 ) ( 27 ) ) )
        ( VALUE #( (  92 ) ( 78 ) ( 21 ) ( 63 ) ( 51 ) ) )
        ( VALUE #( (  24 ) ( 12 ) ( 90 ) ( 94 ) ( 47 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( ( 5 ) ( 41 ) ( 63 ) ( 42 ) ( 73 ) ) )
        ( VALUE #( (  37 ) ( 80 ) ( 91 ) ( 18 ) ( 50 ) ) )
        ( VALUE #( ( 3 ) ( 24 ) ( 53 ) ( 17 ) ( 49 ) ) )
        ( VALUE #( ( 6 ) ( 86 ) ( 30 ) ( 46 ) ( 69 ) ) )
        ( VALUE #( (  16 ) ( 97 ) ( 75 ) ( 88 ) ( 93 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  97 ) ( 60 ) ( 66 ) ( 77 ) ( 74 ) ) )
        ( VALUE #( ( 1 ) ( 72 ) ( 41 ) ( 69 ) ( 94 ) ) )
        ( VALUE #( (  30 )  ( 8 ) ( 98 ) ( 33 ) ( 43 ) ) )
        ( VALUE #( (  99 ) ( 63 ) ( 95 ) ( 91 ) ( 11 ) ) )
        ( VALUE #( (  56 ) ( 65 ) ( 70 ) ( 12 )  ( 0 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  47 ) ( 39 ) ( 37 ) ( 79 ) ( 48 ) ) )
        ( VALUE #( (  60 ) ( 31 ) ( 19 ) ( 10 ) ( 53 ) ) )
        ( VALUE #( (  14 ) ( 36 ) ( 25 ) ( 38 )  ( 2 ) ) )
        ( VALUE #( (  76 ) ( 89 ) ( 32 )  ( 1 ) ( 20 ) ) )
        ( VALUE #( (  65 ) ( 72 ) ( 91 ) ( 71 ) ( 66 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  87 ) ( 72 ) ( 13 ) ( 30 ) ( 75 ) ) )
        ( VALUE #( (  50 ) ( 80 ) ( 97 ) ( 17 ) ( 63 ) ) )
        ( VALUE #( (  99 )  ( 9 ) ( 53 ) ( 69 ) ( 86 ) ) )
        ( VALUE #( (  20 ) ( 57 ) ( 92 ) ( 66 ) ( 21 ) ) )
        ( VALUE #( (  31 ) ( 42 )  ( 4 ) ( 98 )  ( 0 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  38 ) ( 89 ) ( 15 ) ( 91 ) ( 95 ) ) )
        ( VALUE #( (  94 ) ( 20 ) ( 13 ) ( 64 ) ( 25 ) ) )
        ( VALUE #( (  37 )  ( 9 ) ( 98 ) ( 10 ) ( 44 ) ) )
        ( VALUE #( (  28 ) ( 97 )  ( 5 ) ( 78 ) ( 32 ) ) )
        ( VALUE #( (  99 ) ( 41 ) ( 82 ) ( 22 ) ( 87 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  97 ) ( 16 ) ( 42 ) ( 87 ) ( 15 ) ) )
        ( VALUE #( (  19 ) ( 70 ) ( 82 ) ( 66 ) ( 30 ) ) )
        ( VALUE #( (  79 )  ( 5 ) ( 67 ) ( 75 ) ( 91 ) ) )
        ( VALUE #( (  27 ) ( 26 ) ( 56 ) ( 63 ) ( 17 ) ) )
        ( VALUE #( (  51 ) ( 99 ) ( 13 ) ( 59 ) ( 35 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  85 ) ( 33 )  ( 3 ) ( 34 )  ( 5 ) ) )
        ( VALUE #( (  72 ) ( 74 ) ( 88 ) ( 81 ) ( 10 ) ) )
        ( VALUE #( ( 4 ) ( 64 ) ( 61 ) ( 59 )  ( 8 ) ) )
        ( VALUE #( (  78 ) ( 42 ) ( 90 ) ( 27 ) ( 80 ) ) )
        ( VALUE #( (  14 ) ( 12 ) ( 52 ) ( 76 )  ( 1 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  67 ) ( 92 ) ( 61 ) ( 33 ) ( 60 ) ) )
        ( VALUE #( (  82 ) ( 91 ) ( 85 ) ( 76 ) ( 56 ) ) )
        ( VALUE #( (  39 ) ( 37 )  ( 6 ) ( 65 ) ( 63 ) ) )
        ( VALUE #( (  32 ) ( 51 ) ( 45 ) ( 14 ) ( 98 ) ) )
        ( VALUE #( (  73 ) ( 17 )  ( 8 ) ( 46 ) ( 70 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  97 ) ( 75 ) ( 33 )  ( 9 ) ( 23 ) ) )
        ( VALUE #( (  85 ) ( 27 ) ( 15 )  ( 3 ) ( 26 ) ) )
        ( VALUE #( ( 4 ) ( 34 ) ( 36 ) ( 10 ) ( 77 ) ) )
        ( VALUE #( (  68 ) ( 82 ) ( 37 ) ( 32 ) ( 86 ) ) )
        ( VALUE #( (  58 ) ( 88 ) ( 95 ) ( 87 ) ( 99 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  70 ) ( 19 ) ( 67 ) ( 42 ) ( 31 ) ) )
        ( VALUE #( (  81 )  ( 6 ) ( 10 ) ( 95 ) ( 18 ) ) )
        ( VALUE #( (  85 ) ( 50 ) ( 90 ) ( 25 ) ( 56 ) ) )
        ( VALUE #( (  16 ) ( 94 )  ( 7 ) ( 78 ) ( 24 ) ) )
        ( VALUE #( (  59 ) ( 88 ) ( 93 ) ( 77 )  ( 4 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  92 ) ( 25 ) ( 16 ) ( 75 ) ( 67 ) ) )
        ( VALUE #( (  97 ) ( 71 ) ( 53 ) ( 32 ) ( 90 ) ) )
        ( VALUE #( ( 6 ) ( 70 ) ( 69 ) ( 55 ) ( 40 ) ) )
        ( VALUE #( (  77 ) ( 20 ) ( 72 ) ( 84 ) ( 73 ) ) )
        ( VALUE #( (  34 ) ( 35 ) ( 38 ) ( 98 ) ( 76 ) ) )
        ) ) ( VALUE #(
        ( VALUE #( (  24 ) ( 96 ) ( 27 ) ( 39 )  ( 3 ) ) )
        ( VALUE #( (  54 ) ( 26 ) ( 12 ) ( 65 ) ( 60 ) ) )
        ( VALUE #( (  67 ) ( 62 ) ( 43 ) ( 98 ) ( 14 ) ) )
        ( VALUE #( (  15 ) ( 95 )  ( 2 ) ( 82 ) ( 33 ) ) )
        ( VALUE #( (  64 ) ( 17 ) ( 86 )  ( 0 ) ( 63 ) ) )
        ) )
).

  ENDMETHOD.

ENDCLASS.
