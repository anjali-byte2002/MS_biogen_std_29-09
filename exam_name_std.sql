WITH structurally_cleaned AS (
SELECT distinct
exam_name AS exam_name_raw,
TRIM(
REGEXP_REPLACE(
REGEXP_REPLACE(
REGEXP_REPLACE(
REGEXP_REPLACE(TRIM(exam_name), '\\s+', ' '),
,(?=\\S)', ', '
),
\\s*[:?]+\\s*$', ''
),
^[\\-\\*\\.>%]+\\s*|\\s*[\\-\\*\\.>%]+$', ''
)
) AS exam_name_cleaned
FROM biogen_consolidated.examination
)
SELECT
exam_name_raw,
CASE LOWER(exam_name_cleaned)
WHEN '' THEN ''
WHEN '(see activity/participation limitations below)' THEN '(See Activity/Participation Limitations Below)'
WHEN '(see goals listed below)' THEN '(See Goals Listed Below)'
WHEN '/s/ to /z/ ratio' THEN '/S/ to /Z/ Ratio'
WHEN '1' THEN '1'
WHEN '10' THEN '10'
WHEN '10th cranial nerve' THEN '10th Cranial Nerve'
WHEN '11' THEN '11'
WHEN '11th cranial nerve' THEN '11th Cranial Nerve'
WHEN '12th cranial nerve' THEN '12th Cranial Nerve'
WHEN '1st cranial nerve (rose, orange, peppermint)' THEN '1st Cranial Nerve (Rose, Orange, Peppermint)'
WHEN '2' THEN '2'
WHEN '25 foot ta' THEN '25 Foot TA'
WHEN '2nd cranial nerve' THEN '2nd Cranial Nerve'
WHEN '3' THEN '3'
WHEN '3rd, 4th and 6th cranial nerve' THEN '3rd, 4th and 6th Cranial Nerve'
WHEN '4' THEN '4'
WHEN '5' THEN '5'
WHEN '5th cranial nerve' THEN '5th Cranial Nerve'
WHEN '6' THEN '6'
WHEN '7' THEN '7'
WHEN '7th cranial nerve' THEN '7th Cranial Nerve'
WHEN '8' THEN '8'
WHEN '8th cranial nerve' THEN '8th Cranial Nerve'
WHEN '9' THEN '9'
WHEN '9 hole peg test (nhpt)' THEN '9 Hole Peg Test (NHPT)'
WHEN '9th cranial nerve' THEN '9th Cranial Nerve'
WHEN 'abdomen' THEN 'Abdomen'
WHEN 'abdominal examination' THEN 'Abdominal Examination'
WHEN 'abducens' THEN 'Abducens'
WHEN 'abnormal/psychotic thoughts' THEN 'Abnormal/Psychotic Thoughts'
WHEN 'abstraction' THEN 'Abstractions'
WHEN 'abstractions' THEN 'Abstractions'
WHEN 'accessory' THEN 'Accessory'
WHEN 'acclimatization' THEN 'Acclimatization'
WHEN 'acoustic' THEN 'Acoustic'
WHEN 'action tremor-left' THEN 'Action Tremor-Left'
WHEN 'action tremor-right' THEN 'Action Tremor-Right'
WHEN 'activities' THEN 'Activities'
WHEN 'activity' THEN 'Activity'
WHEN 'activity limitations' THEN 'Activity Limitations'
WHEN 'additional cognitive' THEN 'Additional Cognitive'
WHEN 'additional comments' THEN 'Additional Comments'
WHEN 'additional observations' THEN 'Additional Observations'
WHEN 'adnexa' THEN 'Adnexa'
WHEN 'adventitious movements' THEN 'Adventitious Movements'
WHEN 'affect' THEN 'Affect'
WHEN 'alertness' THEN 'Alertness'
WHEN 'alignment' THEN 'Alignment'
WHEN 'also present' THEN 'Also Present'
WHEN 'also present during encounter' THEN 'Also Present During Encounter'
WHEN 'alt' THEN 'ALT'
WHEN 'alteration in gait/equilibrium' THEN 'Alteration in Gait/Equilibrium'
WHEN 'alteration in mentation' THEN 'Alteration in Mentation'
WHEN 'alteration in speech' THEN 'Alteration in Speech'
WHEN 'ambulation' THEN 'Ambulation'
WHEN 'ankle' THEN 'Ankle'
WHEN 'ankles and feet' THEN 'Ankles and Feet'
WHEN 'anorectal/perineum' THEN 'Anorectal and Perineum'
WHEN 'anus/perineum' THEN 'Anus and Perineum'
WHEN 'anxiety screening' THEN 'Anxiety Screening'
WHEN 'aphasia' THEN 'Aphasia'
WHEN 'appearance' THEN 'Appearance'
WHEN 'arise chair' THEN 'Arise Chair'
WHEN 'arizona battery cognitive-communication disorders-2 (abcd-2)' THEN 'Arizona Battery Cognitive-Communication Disorders-2 (ABCD-2)'
WHEN 'arm extension' THEN 'Arm Extension'
WHEN 'as a passenger in a car for an hour without a break' THEN 'As a Passenger in a Car for an Hour Without a Break'
WHEN 'ask for the 3 objects from registration score' THEN 'Ask for the 3 Objects from Registration Score'
WHEN 'aspirin or antiplatelet not given' THEN 'Aspirin or Antiplatelet Not Given'
WHEN 'assess level of consciousness along a continuum' THEN 'Assess Level of Consciousness Along a Continuum'
WHEN 'assessment of dysphagia' THEN 'Assessment of Dysphagia'
WHEN 'assessment of motor function' THEN 'Assessment of Motor Function'
WHEN 'assistive devices' THEN 'Assistive Devices'
WHEN 'attention' THEN 'Attention Span'
WHEN 'attention and concentration' THEN 'Attention and Concentration'
WHEN 'attention span' THEN 'Attention Span'
WHEN 'attention span and concentration' THEN 'Attention Span and Concentration'
WHEN 'attention span and remote memory' THEN 'Attention Span and Remote Memory'
WHEN 'attention span/concentration' THEN 'Attention Span/Concentration'
WHEN 'attention/concentration' THEN 'Attention and Concentration'
WHEN 'attitude' THEN 'Attitude'
WHEN 'attitude toward provider' THEN 'Attitude Toward Provider'
WHEN 'audiologic evaluation' THEN 'Audiologic Evaluation'
WHEN 'auditory' THEN 'Auditory'
WHEN 'auditory comprehension' THEN 'Auditory Comprehension'
WHEN 'auditory hallucinations' THEN 'Auditory Hallucinations'
WHEN 'auscultation of heart' THEN 'Auscultation of Heart'
WHEN 'average hours of sleep per night' THEN 'Average Hours of Sleep Per Night'
WHEN 'awake' THEN 'Awake'
WHEN 'b12' THEN 'B12'
WHEN 'babinski' THEN 'Babinski'
WHEN 'babinski reflex' THEN 'Babinski Reflex'
WHEN 'back' THEN 'Back'
WHEN 'back exam' THEN 'Back Exam'
WHEN 'balance' THEN 'Balance'
WHEN 'barriers to adherence' THEN 'Barriers to Adherence'
WHEN 'batteries' THEN 'Batteries'
WHEN 'behavior' THEN 'Behavior'
WHEN 'behavioral observations during phonation' THEN 'Behavioral Observations During Phonation'
WHEN 'bell''s palsy' THEN 'Bell''s Palsy'
WHEN 'benadryl' THEN 'Benadryl'
WHEN 'biceps, triceps, brachioradialis, knees' THEN 'Biceps, Triceps, Brachioradialis, Knees'
WHEN 'bilirubin' THEN 'Bilirubin'
WHEN 'bladder' THEN 'Bladder'
WHEN 'blepharospasm' THEN 'Blepharospasm'
WHEN 'blood' THEN 'Blood'
WHEN 'blood return' THEN 'Blood Return'
WHEN 'bmi classification' THEN 'BMI Classification'
WHEN 'bmi follow up not documented' THEN 'BMI Follow Up Not Documented'
WHEN 'bmi not documented' THEN 'BMI Not Documented'
WHEN 'body bradykinesia' THEN 'Body Bradykinesia'
WHEN 'body fat' THEN 'Body Fat'
WHEN 'boston diagnostic aphasia examination-3 (bdae-3)' THEN 'Boston Diagnostic Aphasia Examination-3 (BDAE-3)'
WHEN 'boston naming test (bnt)' THEN 'Boston Naming Test (BNT)'
WHEN 'bowel & bladder function' THEN 'Bowel and Bladder Functions'
WHEN 'bowel and bladder functions' THEN 'Bowel and Bladder Functions'
WHEN 'bp management' THEN 'BP Management'
WHEN 'bradykinesia' THEN 'Bradykinesia'
WHEN 'bragard''s test' THEN 'Bragard''s Test'
WHEN 'brainstem functions' THEN 'Brainstem Functions'
WHEN 'breast' THEN 'Breasts'
WHEN 'breasts' THEN 'Breasts'
WHEN 'bulk' THEN 'Bulk'
WHEN 'c spine exam' THEN 'C Spine Exam'
WHEN 'caffeine' THEN 'Caffeine'
WHEN 'calculations' THEN 'Calculations'
WHEN 'caloric function tests' THEN 'Caloric Function Tests'
WHEN 'candidacy' THEN 'Candidacy'
WHEN 'cape-v' THEN 'CAPE-V'
WHEN 'cardiac' THEN 'Cardiac Exam'
WHEN 'cardiac exam' THEN 'Cardiac Exam'
WHEN 'cardiovascular' THEN 'Cardiovascular Examination'
WHEN 'cardiovascular examination' THEN 'Cardiovascular Examination'
WHEN 'cardiovascular system' THEN 'Cardiovascular System'
WHEN 'care planning i' THEN 'Care Planning I'
WHEN 'caregiver needs/knowledge/social supports' THEN 'Caregiver Needs/Knowledge/Social Supports'
WHEN 'carotid ascultation' THEN 'Carotid Ascultation'
WHEN 'carotid auscultation' THEN 'Carotid Auscultation'
WHEN 'carotid doppler' THEN 'Carotid Doppler'
WHEN 'carotids' THEN 'Carotids'
WHEN 'case management' THEN 'Case Management'
WHEN 'cc' THEN 'CC'
WHEN 'central neurologic examination' THEN 'Central Neurologic Examination'
WHEN 'cerebellar' THEN 'Cerebellar Examination'
WHEN 'cerebellar examination' THEN 'Cerebellar Examination'
WHEN 'cerebellar functions' THEN 'Cerebellar Functions'
WHEN 'cerebellar signs' THEN 'Cerebellar Signs'
WHEN 'cerebellar testing grossly/intact' THEN 'Cerebellar Testing Grossly/Intact'
WHEN 'cerebral functions' THEN 'Cerebral Functions'
WHEN 'certification of plan of care' THEN 'Certification of Plan of Care'
WHEN 'certification/benefits' THEN 'Certification/Benefits'
WHEN 'cervical' THEN 'Cervical'
WHEN 'cervical compression test' THEN 'Cervical Compression Test'
WHEN 'cervical dystonia' THEN 'Cervical Dystonia'
WHEN 'cervical spine' THEN 'Cervical Spine Examination'
WHEN 'cervical spine exam' THEN 'Cervical Spine Examination'
WHEN 'cervical testing' THEN 'Cervical Testing'
WHEN 'cervix' THEN 'Cervix'
WHEN 'changes in the patient''s condition that now requires the use of a power mobility device' THEN 'Changes in the Patient''s Condition That Now Requires the Use of a Power Mobility Device'
WHEN 'chaperone' THEN 'Chaperone'
WHEN 'chaperoned by' THEN 'Chaperoned by'
WHEN 'chart' THEN 'Chart'
WHEN 'chest' THEN 'Chest'
WHEN 'chest/ lungs' THEN 'Chest and Lungs'
WHEN 'chest/lungs' THEN 'Chest and Lungs'
WHEN 'chewing/swallowing' THEN 'Chewing/Swallowing'
WHEN 'chlortrimeton' THEN 'Chlortrimeton'
WHEN 'ci mapping' THEN 'CI Mapping'
WHEN 'clinical dementia rating (cdr)' THEN 'Clinical Dementia Rating (CDR)'
WHEN 'clinical reports reviewed' THEN 'Clinical Reports Reviewed'
WHEN 'clinical trial' THEN 'Clinical Trial'
WHEN 'clockface' THEN 'Clockface'
WHEN 'cn' THEN 'CN'
WHEN 'cognition' THEN 'Cognition'
WHEN 'cognition and comprehension' THEN 'Cognition and Comprehension'
WHEN 'cognitive baseline' THEN 'Cognitive Baseline'
WHEN 'cognitive evaluation and review of results' THEN 'Cognitive Evaluation and Review of Results'
WHEN 'cognitive impairment assessment' THEN 'Cognitive Impairment Assessment'
WHEN 'cognitive linguistic quick test + (clqt+)' THEN 'Cognitive Linguistic Quick Test + (CLQT+)'
WHEN 'cognitive testing' THEN 'Cognitive Testing'































































































































































































































































































































































































































































































































































































































































































































































































































